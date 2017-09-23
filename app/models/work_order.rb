class WorkOrder < ActiveRecord::Base
  has_many :mail_logs, as: :mail_loggable
  belongs_to :job, required: true

  has_many :work_order_vendors
  has_many :vendors, through: :work_order_vendors

  has_many :work_order_users
  has_many :users, through: :work_order_users
  has_many :technicians, -> {with_role('Technician')}, through: :work_order_users, class_name: 'User', source: :user
  has_many :crew_chiefs, -> {with_role('Crew Chief')}, through: :work_order_users, class_name: 'User', source: :user

  delegate :customer, :franchise, :job_managers, to: :job, allow_nil: true

  delegate :full_address, :address_without_county, to: :customer, allow_nil: true, prefix: true

  delegate :company_name, :full_address, :address_without_county, to: :customer, allow_nil: true, prefix: true

  delegate :name, :full_address, :address_without_county, to: :franchise, allow_nil: true, prefix: true

  alias_method :job_location, :customer_full_address
  alias_method :franchise_location, :franchise_name

  scope :date_ordered, -> {order(:date)}

  def job_manager_contact_info
    job_managers.present? ? job_managers.map{|manager| manager.full_name} : ''
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

  def initialize_from_job(job, typed_by)
    self.job = job
    self.typed_by = typed_by.full_name
    self.name = job.try(:job_coordinator).try(:full_name)
    self.job_name = job.name
    self.telephone = job.try(:customer).try(:phones).try(:number)
    self.contact = job.try(:customer).try(:full_name)
    self.insurance = job.try(:job_detail).try(:insurance_company).try(:name)
    self.adjuster = job.try(:adjuster).try(:full_name)
    self.claim_number = job.try(:job_detail).try(:claim_number)
    self.referral = job.try(:referral_type).try(:name)
  end
end
