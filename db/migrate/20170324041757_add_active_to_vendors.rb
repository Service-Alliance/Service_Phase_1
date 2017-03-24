class AddActiveToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :active, :boolean, default: true
  end
end
