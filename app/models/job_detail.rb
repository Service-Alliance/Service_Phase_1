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
