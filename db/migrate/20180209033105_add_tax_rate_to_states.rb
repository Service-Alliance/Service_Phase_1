class AddTaxRateToStates < ActiveRecord::Migration
  def change
    add_column :states, :tax_rate, :decimal, null: false, default: 0
  end
end
