class AddVendorIdToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :vendor_id, :integer
  end
end
