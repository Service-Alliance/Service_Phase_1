class AddFieldsToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :hours_on_job, :text
  end
end
