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

class JobDetail < ActiveRecord::Base
  belongs_to :job
  belongs_to :insurance_company
  # belongs_to :coverage_type, foreign_key: :coverage_type_id, class_name: "AffectedType"
  belongs_to :self_pay, foreign_key: :self_pay_id, class_name: "AffectedType"
  belongs_to :esl_nst_amount, foreign_key: :esl_nst_amount_id, class_name: "AffectedType"
  belongs_to :deductible, foreign_key: :deductible_id, class_name: "AffectedType"
  belongs_to :billing_address, foreign_key: :billing_address_id,
                               class_name: 'Address'

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def full_name
    first = billing_address_first_name || " "
    last = billing_address_last_name || " "
    return "#{first+ " " + last}"
  end
end
