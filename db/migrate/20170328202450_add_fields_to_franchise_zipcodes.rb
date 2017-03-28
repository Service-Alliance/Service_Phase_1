class AddFieldsToFranchiseZipcodes < ActiveRecord::Migration
  def change
    add_column :franchise_zipcodes, :city, :string
    add_column :franchise_zipcodes, :county, :string
    add_column :franchise_zipcodes, :assigned, :boolean
  end
end
