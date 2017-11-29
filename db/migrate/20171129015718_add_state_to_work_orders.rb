class AddStateToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :state, :integer, null: false, default: 0
  end
end
