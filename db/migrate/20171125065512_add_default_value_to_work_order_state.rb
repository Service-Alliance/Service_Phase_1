class AddDefaultValueToWorkOrderState < ActiveRecord::Migration
  def up
    change_column :work_orders, :state, :integer, default: 0
  end

  def down
    change_column :work_orders, :state, :integer, default: nil
  end
end
