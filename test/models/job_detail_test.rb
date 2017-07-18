# == Schema Information
#
# Table name: job_details
#
#  id                         :integer          not null, primary key
#  insurance_company_id       :integer
#  claim_number               :string
#  policy_number              :string
#  coverage_type_id           :integer
#  deductible_amount          :integer
#  self_pay_id                :integer
#  deductible_id              :integer
#  esl_nst_amount_id          :integer
#  emergency_service_amount   :integer
#  job_id                     :integer
#  billing_address_first_name :string
#  billing_address_last_name  :string
#  billing_address_id         :integer
#  billing_type_id            :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  coverage_type              :text
#

require 'test_helper'

class JobDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
