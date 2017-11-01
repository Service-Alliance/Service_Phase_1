# Job
class Job < ActiveRecord::Base
  belongs_to :job_status, foreign_key: :status_id, class_name: 'JobStatus'
  belongs_to :job_type, foreign_key: :type_id, class_name: 'JobType'
  belongs_to :franchise
  belongs_to :referral_type
  belongs_to :customer
  has_one :customer_address, through: :customer, source: "address"
  has_many :calls
  belongs_to :user, foreign_key: :entered_by_id
  belongs_to :job_coordinator, foreign_key: :coordinator_id, class_name: "User"
  belongs_to :agent
  belongs_to :adjuster
  has_one :property, dependent: :destroy
  has_one :caller, dependent: :destroy
  has_many :losses, dependent: :destroy
  has_one :job_detail, dependent: :destroy
  has_one :emergency_contact, dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  has_many :job_managers, dependent: :destroy
  has_many :vendor_assignments
  has_many :contact_assignments
  has_many :job_forms, dependent: :destroy
  has_many :notes, as: :noteable, dependent: :destroy
  has_many :trackers, as: :trackable, dependent: :destroy
  has_many :work_orders
  has_many :schedulers
  belongs_to :referral_vendor, foreign_key: :referral_vendor_id, class_name: 'Vendor'
  belongs_to :referral_employee, foreign_key: :referral_employee_id, class_name: 'User'
  has_many :subscriptions
  has_many :collection_subscriptions
  has_one :inspection_checklist
  has_many :pricings, dependent: :destroy
  has_many :vendor_assignments, dependent: :destroy
  has_many :occupants

  accepts_nested_attributes_for :losses
  accepts_nested_attributes_for :job_detail
  accepts_nested_attributes_for :property
  accepts_nested_attributes_for :customer

  delegate :full_name, to: :job_coordinator, allow_nil: true, prefix: true
  delegate :full_name, to: :user, allow_nil: true, prefix: true
  delegate :full_name, :address_without_county, :format_address, :full_address, :first_phone_number, to: :customer, allow_nil: true, prefix: true
  delegate :name, to: :job_status, allow_nil: true, prefix: true
  delegate :name, to: :franchise, allow_nil: true, prefix: true
  delegate :full_address, :format_address, to: :caller, allow_nil: true, prefix: true
  delegate :insurance_company, to: :job_detail, allow_nil: true, prefix: false
  delegate :name, to: :insurance_company, allow_nil: true, prefix: true
  delegate :name, to: :referral_type, allow_nil: true, prefix: true

  # Activity Tracking activated
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  scope :with_manager_id, -> (user_id) { joins(:job_managers).merge(JobManager.where(:job_manager_id => user_id)) }

  scope :latest_first, -> {order(created_at: :desc)}

  def self.with_status(status)
    joins(:job_status)
      .where(job_status: {name: status})
  end

  def self.owned_by(user)
    where(coordinator_id: user.id)
  end

  def self.entered_by(user)
    where(entered_by_id: user.id)
  end

  alias_method :insurance_details, :insurance_company

  def job_loss_type
    losses.first.try(:loss_type)
  end

  def loss_type_names
    losses.map(&:loss_type_name).delete_if(&:blank?)
  end

  def job_manager_names
    job_managers.map(&:full_name)
  end

  def self.value
    Pricing
      .from(
        Pricing
          .where(job_id: all)
          .latest_per_job
      )
      .sum('subquery.price')
  end

  def progress
    manager_assigned = self.job_managers.any?
    manager_visited = self.job_managers.first && self.job_managers.first.schedule_date && self.job_managers.first.schedule_date >= Date.today
    estimate_created = self.estimate_created
    estimate_sent = self.estimate_sent
    contract_sent = self.contract_sent
    contract_created = self.contract_created
    if contract_sent == true
      return '96'
    elsif contract_created == true
      return '84'
    elsif estimate_sent == true
      return '70'
    elsif estimate_created == true
      return '56'
    elsif manager_visited == true
      return '42'
    elsif manager_assigned == true
      return '28'
    else
      return '14'
    end
  end
  def self.to_csv

    CSV.generate(headers: true) do |csv|
      csv << ["Job ID", "Job Type", "Job Status", "Franchise"]

      all.each do |job|
        csv << ([job.id, job.try(:job_type).try(:name), job.try(:job_status).try(:name), job.try(:franchise).try(:name)])
      end
    end
  end

  def self.customer_search_suggestions(query)
    customer_or_address = Customer.joins(:address).where("first_name @@ :q or last_name @@ :q or email @@ :q or company_name @@ :q or addresses.address_1 @@ :q or addresses.address_2 @@ :q or addresses.city @@ :q", q: query)
    phones = Customer.joins(:phones).where("phones.number @@ :q", q: query)

    unique_list = (customer_or_address + phones).uniq

    return unique_list
  end

  def self.caller_search_suggestions(query)
    caller_or_address = Caller.joins(:address).where("first_name @@ :q or last_name @@ :q or email @@ :q or company_name @@ :q or addresses.address_1 @@ :q or addresses.address_2 @@ :q or addresses.city @@ :q or phones.number @@ :q", q: query)
    phones = Caller.joins(:phones).where("phones.number @@ :q", q: query)

    unique_list = (caller_or_address + phones).uniq

    return unique_list
  end

  # Check to see if the job is being moved to invoiced
  def moving_to_invoiced(old_status_id, new_status_id, job)
    if old_status_id != new_status_id
      invoiced = JobStatus.find_by(name: "Invoiced")
      if new_status_id === invoiced.id
        job.collection_subscriptions.each do |collection_user|
          UserMailer.job_moved_to_invoiced(collection_user.user, job).deliver_later
        end
      else
        return false
      end
    else
      return false
    end
  end

end
