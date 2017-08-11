class WorkOrder < ActiveRecord::Base
  has_many :mail_logs, as: :mail_loggable
  belongs_to :job, required: true

  delegate :customer, :franchise, :job_managers, to: :job, allow_nil: true

  delegate :full_address, to: :customer, allow_nil: true, prefix: true
  delegate :name, :full_address, to: :franchise, allow_nil: true, prefix: true

  alias_method :job_location, :customer_full_address
  alias_method :franchise_location, :franchise_name

  def job_manager_contact_info
    job_managers.map{|manager| manager.job_manager.full_name}
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
