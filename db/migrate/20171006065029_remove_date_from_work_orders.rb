class RemoveDateFromWorkOrders < ActiveRecord::Migration
  def change
    remove_column :work_orders, :date, :string
  end
end
