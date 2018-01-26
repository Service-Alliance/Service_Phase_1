class CreateContactAddresses < ActiveRecord::Migration
  def change
    create_table :contact_addresses do |t|
      t.integer :address_id
      t.integer :contact_id
      t.integer :address_type_id

      t.timestamps null: false
    end
  end
end
