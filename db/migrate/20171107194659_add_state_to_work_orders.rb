class AddStateToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :state, :integer
  end
end
