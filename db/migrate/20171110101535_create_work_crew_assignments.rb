class CreateWorkCrewAssignments < ActiveRecord::Migration
  def change
    create_table :work_crew_assignments do |t|
      t.references :work_order, index: true, foreign_key: {on_delete: :cascade}
      t.references :work_order_users, index: true
      t.integer :user_id
      t.integer :vendoor_id

       t.timestamps null: false
    end
  end
end
