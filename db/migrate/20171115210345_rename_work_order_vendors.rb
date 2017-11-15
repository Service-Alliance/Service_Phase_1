class RenameWorkOrderVendors < ActiveRecord::Migration
  def change
    rename_table :work_order_vendors, :work_order_vendor_assignment
  end
end
