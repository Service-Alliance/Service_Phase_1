class AddStatusToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :status, :integer
  end
end
