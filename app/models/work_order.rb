# == Schema Information
#
# Table name: work_orders
#
#  id                       :integer          not null, primary key
#  job_id                   :integer
#  to                       :text
#  name                     :text
#  date                     :date
#  typed_by                 :text
#  job_start                :datetime
#  job_name                 :text
#  job_location             :text
#  telephone                :text
#  contact                  :text
#  insurance                :text
#  claim_number             :text
#  crew                     :text
#  approx_time_on_loss      :time
#  required                 :text
#  referral                 :text
#  franchise_location       :text
#  scope_of_work            :text
#  job_manager_contact_info :text
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  acknowledgement          :boolean          default(FALSE)
#  acknowledged_by_id       :integer
#  vendor_id                :integer
#

class WorkOrder < ActiveRecord::Base
  has_many :mail_logs, as: :mail_loggable

  def initialize_from_job(job, typed_by)
    self.typed_by = typed_by.full_name
    self.name = job.try(:job_coordinator).try(:full_name)
    self.job_name = job.name
    self.job_location = job.try(:customer).try(:full_address)
    self.telephone = job.try(:customer).try(:phones).try(:number)
    self.contact = job.try(:customer).try(:full_name)
    self.insurance = job.try(:job_detail).try(:insurance_company).try(:name)
    self.adjuster = job.try(:adjuster).try(:full_name)
    self.claim_number = job.try(:job_detail).try(:claim_number)
    self.referral = job.try(:referral_type).try(:name)
    self.franchise_location = job.try(:franchise).try(:name)
    self.job_manager_contact_info = job.job_managers.map{|manager| manager.job_manager.try(:full_name)}
  end
end
