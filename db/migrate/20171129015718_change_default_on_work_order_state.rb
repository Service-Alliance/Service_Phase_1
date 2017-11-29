class ChangeDefaultOnWorkOrderState < ActiveRecord::Migration
  def up
    change_column :work_orders, :state, :integer, default: 0, null: false
  end

  def down
    change_column :work_orders, :state, :integer, default: nil, null: true
  end
end
