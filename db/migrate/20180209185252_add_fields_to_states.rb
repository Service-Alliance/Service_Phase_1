class AddFieldsToStates < ActiveRecord::Migration
  def change
  	add_column :states, :city_name, :string
  	add_column :states, :county_name, :string
  	add_column :states, :county_rate, :decimal, null: false, default: 0
	add_column :states, :city_rate, :decimal, null: false, default: 0
  	add_column :states, :special_rate, :decimal, null: false, default: 0
  	add_column :states, :local_tax_total, :decimal, null: false, default: 0
  end
end
