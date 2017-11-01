class RemoveApproxTomeFromWorkOrders < ActiveRecord::Migration
  def change
    remove_column :work_orders, :approx_time_on_loss, :time
  end
end
