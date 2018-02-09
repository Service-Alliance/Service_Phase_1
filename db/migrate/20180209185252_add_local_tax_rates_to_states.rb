class AddLocalTaxRatesToStates < ActiveRecord::Migration
  def change
  	add_column :states, :local_tax_rate, :decimal, array: true, null: false, default: [0]
  end
end
