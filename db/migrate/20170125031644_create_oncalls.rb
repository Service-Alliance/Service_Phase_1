class CreateOncalls < ActiveRecord::Migration
  def change
    create_table :oncalls do |t|
      t.date :scheduled_on
      t.integer :user_id
      t.integer :priority

      t.timestamps null: false
    end
  end
end
