class RemoveApproxTimeOnLossFromWorkOrders < ActiveRecord::Migration
  def change
    remove_column :work_orders, :approx_time_on_loss, :time
    remove_column :work_orders, :crew, :string
  end
end
