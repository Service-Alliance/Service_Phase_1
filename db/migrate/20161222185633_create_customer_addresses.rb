class CreateCustomerAddresses < ActiveRecord::Migration
  def change
    create_table :customer_addresses do |t|
      t.integer :address_id
      t.integer :customer_id
      t.integer :address_type_id

      t.timestamps null: false
    end
  end
end
