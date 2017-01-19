class CreateAdjusters < ActiveRecord::Migration
  def change
    create_table :adjusters do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :address_id
      t.integer :insurance_company_id

      t.timestamps null: false
    end
  end
end
