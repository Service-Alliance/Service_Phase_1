class CreateCustomerCompanies < ActiveRecord::Migration
  def change
    create_table :customer_companies do |t|
      t.integer :company_id
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
