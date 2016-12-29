class CreateJobDetails < ActiveRecord::Migration
  def change
    create_table :job_details do |t|
      t.integer :insurance_company_id
      t.string :claim_number
      t.string :policy_number
      t.integer :coverage_type_id
      t.integer :deductible_amount
      t.integer :self_pay_id
      t.integer :deductible_id
      t.integer :esl_nst_amount_id
      t.integer :emergency_service_amount
      t.integer :job_id

      t.timestamps null: false
    end
  end
end
