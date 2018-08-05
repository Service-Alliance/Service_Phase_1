class AddLocalTaxToFranchiseZipcodes < ActiveRecord::Migration
  def change
    add_column :franchise_zipcodes, :county_rate, :decimal, null: false, default: 0
 	add_column :franchise_zipcodes, :city_rate, :decimal, null: false, default: 0
   	add_column :franchise_zipcodes, :special_rate, :decimal, null: false, default: 0
  	add_column :franchise_zipcodes, :local_tax_total, :decimal, null: false, default: 0
  end
end
