class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :address_1
      t.string :address_2
      t.integer :zip
      t.string :city
      t.integer :state_id
      t.string :county

      t.timestamps null: false
    end
  end
end
