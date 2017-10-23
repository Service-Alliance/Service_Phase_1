class AddTotalTimeToWorkshifts < ActiveRecord::Migration
  def change
    add_column :work_shifts, :total_time, :decimal
  end
end
