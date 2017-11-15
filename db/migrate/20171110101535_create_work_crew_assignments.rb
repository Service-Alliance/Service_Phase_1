class CreateWorkCrewAssignments < ActiveRecord::Migration
  def change
    create_table :work_crew_assignments do |t|
      t.references :work_order, index: true, foreign_key: {on_delete: :cascade}
      t.references :user, index: true, foreign_key: {on_delete: :cascade}
      t.references :vendor, index: true, foreign_key: {on_delete: :cascade}

       t.timestamps null: false
    end
  end
end
