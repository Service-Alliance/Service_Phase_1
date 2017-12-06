class WorkOrder < ActiveRecord::Base
  include AASM

  include PgSearch

  has_many :mail_logs, as: :mail_loggable
  belongs_to :job, required: true
  belongs_to :vendor, required: false
  has_many :work_order_crew, dependent: :destroy
  has_many :crew, through: :work_order_crew, class_name: 'User', source: :user
  has_many :technicians, -> { with_roles('Technician') }, through: :work_order_crew, class_name: 'User', source: :user
  has_many :crew_chiefs, -> { with_roles('Crew Chief', 'Project Manager') }, through: :work_order_crew, class_name: 'User', source: :user
  has_many :work_shifts, dependent: :destroy

  delegate :customer, :franchise, :job_managers, :status_name, to: :job, allow_nil: true
  delegate :name, to: :job, allow_nil: true, prefix: true
  delegate :company_name, :full_address, :address_without_county, to: :customer, allow_nil: true, prefix: true
  delegate :name, :full_address, :address_without_county, to: :franchise, allow_nil: true, prefix: true
  delegate :name, to: :vendor, allow_nil: true, prefix: true

  accepts_nested_attributes_for :work_order_crew, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :work_shifts, :reject_if => :all_blank, :allow_destroy => true

  alias_method :franchise_location, :franchise_name
  alias_method :job_location, :customer_address_without_county

  scope :date_ordered, -> { order(:updated_at) }

  enum state: {draft: 0, published: 1}

  aasm :state do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published, :after => Proc.new {|user| self.publish_actions(user)  }
    end
  end

  pg_search_scope :text_search,
    against: [:contact, :telephone, :referral, :required, :scope_of_work, :id, :state],
    associated_against: {
      job: [:name],
      vendor: [:name]
    },
    using: {
      tsearch: {prefix: true}
    }

  def draft_actions
  end

  def publish_actions(user)
    tracker_task = TrackerTask.find_by(name: "Work Order Delivered")
    job.trackers.create(tracker_task_id: tracker_task.id, child_id: id, user_id: user.id)
    WorkOrderPublishDeliveryService.new(self, user).deliver!
    save
  end

  def location
    job_location || customer_address_without_county
  end

  def job_manager_contact_info
    job_managers.present? ? job_managers.map { |manager| manager.full_name } : ''
  end

  def to
    vendor_name || servpro_name
  end

  def vendor_name
    vendor.present? ? vendor.try(:name) : servpro_name
  end

  def servpro_name
    franchise_name.present? ? I18n.t('work_orders.servpro_of_franchise', franchise: franchise_name) : I18n.t('work_orders.servpro')
  end

  def crew_names
    crew.map(&:full_name).join(', ')
  end

  def technician_names
    technicians.map(&:full_name)
  end

  def crew_chief_names
    crew_chiefs.map(&:full_name)
  end

  def self.build_from_job(job, typed_by_full_name = nil)
    new(
      job: job,
      typed_by: typed_by_full_name,
      name: job.try(:job_coordinator).try(:full_name),
      job_name: job.name,
      job_location: job.customer_address_without_county,
      telephone: job.customer.try(:phones).try(:number),
      contact: job.try(:customer).try(:full_name),
      insurance: job.try(:job_detail).try(:insurance_company).try(:name),
      adjuster: job.try(:adjuster).try(:full_name),
      claim_number: job.try(:job_detail).try(:claim_number),
      referral: job.try(:referral_type).try(:name)
    )
  end
end
