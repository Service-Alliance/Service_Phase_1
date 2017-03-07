class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :owner_id
      t.integer :address_id

      t.timestamps null: false
    end
  end
end
