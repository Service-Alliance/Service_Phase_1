class AddAcknowledgementToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :acknowledgement, :boolean, default: false
    add_column :work_orders, :acknowledged_by_id, :integer
  end
end
