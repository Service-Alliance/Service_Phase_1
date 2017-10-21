class AddEventColumnToWorkOrdersTable < ActiveRecord::Migration
  def up
    add_column :work_orders, :events, :string, array: true, default: []

    WorkOrder.find_in_batches do |batch|
      batch.each { |order| order.update_attributes(events: [])}
    end
  end

  def down
    remove_column :work_orders, :events
  end
end
