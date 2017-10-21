class CreateWorkShiftBreaks < ActiveRecord::Migration
  def change
    create_table :work_shift_breaks do |t|
      t.references :work_shift, index: true, foreign_key: {on_delete: :cascade}
      t.time :start
      t.time :end

      t.timestamps null: false
    end
  end
end
