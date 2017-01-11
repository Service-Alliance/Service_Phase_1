class JobDetail < ActiveRecord::Base
  belongs_to :job
  belongs_to :insurance_company
  belongs_to :coverage_type, foreign_key: :coverage_type_id, class_name: "AffectedType"
  belongs_to :self_pay, foreign_key: :self_pay_id, class_name: "AffectedType"
  belongs_to :esl_nst_amount, foreign_key: :esl_nst_amount_id, class_name: "AffectedType"
  belongs_to :deductible, foreign_key: :deductible_id, class_name: "AffectedType"

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
