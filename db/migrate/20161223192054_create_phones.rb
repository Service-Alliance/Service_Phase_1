class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.integer :type_id
      t.integer :occupant_id
      t.integer :caller_id
      t.integer :customer_id
      t.integer :agent_id
      t.integer :adjuster_id
      t.integer :emergency_contact_id
      t.string :extension

      t.timestamps null: false
    end
  end
end
