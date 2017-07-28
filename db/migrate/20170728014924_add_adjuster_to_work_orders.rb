class AddAdjusterToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :adjuster, :text
  end
end
