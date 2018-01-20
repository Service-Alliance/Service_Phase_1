class AddArchivedToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :archived, :boolean, null: false, default: false
  end
end
