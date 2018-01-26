class CreateContactCompanies < ActiveRecord::Migration
  def change
    create_table :contact_companies do |t|
      t.integer :company_id
      t.integer :contact_id

      t.timestamps null: false
    end
  end
end
