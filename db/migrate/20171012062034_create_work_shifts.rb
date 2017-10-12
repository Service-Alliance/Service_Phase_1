class CreateWorkShifts < ActiveRecord::Migration
  def change
    create_table :work_shifts do |t|
      t.references :user, index: true, foreign_key: {on_delete: :cascade}
      t.references :work_order, index: true, foreign_key: {on_delete: :cascade}
      t.date :date
      t.time :start
      t.time :end

      t.timestamps null: false
    end
  end
end
