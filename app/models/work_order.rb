class WorkOrder < ActiveRecord::Base
  has_many :mail_logs, as: :mail_loggable
  belongs_to :job, required: true

  has_many :work_order_vendors
  has_many :vendors, through: :work_order_vendors

  has_many :work_order_users
  has_many :users, through: :work_order_users
  has_many :technicians, -> { with_role('Technician') }, through: :work_order_users, class_name: 'User', source: :user
  has_many :crew_chiefs, -> { with_role('Crew Chief') }, through: :work_order_users, class_name: 'User', source: :user

  delegate :customer, :franchise, :job_managers, to: :job, allow_nil: true
  delegate :full_address, :address_without_county, to: :customer, allow_nil: true, prefix: true
  delegate :company_name, :full_address, :address_without_county, to: :customer, allow_nil: true, prefix: true
  delegate :name, :full_address, :address_without_county, to: :franchise, allow_nil: true, prefix: true

  alias_method :franchise_location, :franchise_name
  alias_method :job_location, :customer_address_without_county

  scope :date_ordered, -> { order(:updated_at) }


  def job_manager_contact_info
    job_managers.present? ? job_managers.map { |manager| manager.full_name } : ''
  end

  def to
    to = vendors.pluck(:name)
    to.unshift(servpro_name) unless to.length == 1
    to
  end

  def servpro_name
    franchise_name.present? ? I18n.t('work_orders.servpro_of_franchise', franchise: franchise_name) : I18n.t('work_orders.servpro')
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
      job_location: job.customer_,
      telephone: job.try(:customer).try(:phones).try(:number),
      contact: job.try(:customer).try(:full_name),
      insurance: job.try(:job_detail).try(:insurance_company).try(:name),
      adjuster: job.try(:adjuster).try(:full_name),
      claim_number: job.try(:job_detail).try(:claim_number),
      referral: job.try(:referral_type).try(:name)
    )
  end
end
