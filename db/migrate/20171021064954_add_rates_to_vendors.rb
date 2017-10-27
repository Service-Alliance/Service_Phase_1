class AddRatesToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :supervisor_rate, :decimal
    add_column :vendors, :technician_rate, :decimal
  end
end
