class AddTotalTimeToWorkShiftBreaks < ActiveRecord::Migration
  def change
    add_column :work_shift_breaks, :total_time, :decimal
  end
end
