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
end
