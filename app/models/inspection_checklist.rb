# == Schema Information
#
# Table name: inspection_checklists
#
#  id                      :integer          not null, primary key
#  estimate_will_be_sent   :date
#  estimate_given_verbally :boolean
#  estimate_range          :decimal(8, 2)
#  notes                   :text
#  next_steps              :text
#  send_within_one_day     :boolean
#  additional_vendor       :boolean
#  verify_information      :boolean
#  potential_construction  :boolean
#  job_id                  :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class InspectionChecklist < ActiveRecord::Base
end
