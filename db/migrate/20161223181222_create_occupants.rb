class CreateOccupants < ActiveRecord::Migration
  def change
    create_table :occupants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :address_id
      t.integer :job_id

      t.timestamps null: false
    end
  end
end
