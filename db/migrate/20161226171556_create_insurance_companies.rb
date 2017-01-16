class CreateInsuranceCompanies < ActiveRecord::Migration
  def change
    create_table :insurance_companies do |t|
      t.string :name
      t.string :bulletin_number
      t.date :effective_date
      t.text :states_involved
      t.string :property_type
      t.text :collect_deductible
      t.integer :esl
      t.text :estimating_software
      t.text :pricing
      t.text :customer_service_contacts
      t.text :special_conditions

      t.timestamps null: false
    end
  end
end
