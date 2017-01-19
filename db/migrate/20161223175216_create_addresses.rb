class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_1
      t.string :address_2
      t.integer :zip_code
      t.string :city
      t.string :county
      t.integer :state_id
      t.integer :address_type_id

      t.timestamps null: false
    end
  end
end
