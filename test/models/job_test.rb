# == Schema Information
#
# Table name: jobs
#
#  id                         :integer          not null, primary key
#  name                       :string
#  type_id                    :integer
#  status_id                  :integer
#  entered_by_id              :integer
#  franchise_id               :integer
#  details                    :text
#  job_note                   :text
#  customer_id                :integer
#  referral_type_id           :integer
#  emergency                  :boolean
#  referral_employee_id       :integer
#  corporate_referral_type_id :integer
#  agent_id                   :integer
#  adjuster_id                :integer
#  recieved                   :date
#  last_action                :date
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  referral_note              :text
#  referral_vendor_id         :integer
#  estimate_created           :boolean          default(FALSE)
#  estimate_created_date      :date
#  estimate_sent              :boolean          default(FALSE)
#  estimate_sent_date         :date
#  contract_created           :boolean          default(FALSE)
#  contract_created_date      :date
#  contract_sent              :boolean          default(FALSE)
#  contract_sent_date         :date
#  coordinator_id             :integer
#  pipeline_status_id         :integer          default(1)
#  work_center_link           :text
#  xact_link                  :text
#  fnol_received              :datetime
#

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
