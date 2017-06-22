class AddVendorIdToWorkOrder < ActiveRecord::Migration
  def change
    add_column :work_orders, :vendor_id, :integer
  end
end
