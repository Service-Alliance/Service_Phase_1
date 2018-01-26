class CreateContactVendors < ActiveRecord::Migration
  def change
    create_table :contact_vendors do |t|
      t.integer :contact_id
      t.integer :vendor_id

      t.timestamps null: false
    end
  end
end
