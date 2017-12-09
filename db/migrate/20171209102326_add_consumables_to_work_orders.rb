class AddConsumablesToWorkOrders < ActiveRecord::Migration
  def change
     add_column :work_orders, :consumables_required?, :boolean, null: false, default: false
  end
end
