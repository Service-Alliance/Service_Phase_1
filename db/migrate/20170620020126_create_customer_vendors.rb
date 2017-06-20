class CreateCustomerVendors < ActiveRecord::Migration
  def change
    create_table :customer_vendors do |t|
      t.integer :customer_id
      t.integer :vendor_id

      t.timestamps null: false
    end
  end
end
