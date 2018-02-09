class AddTaxRateToStates < ActiveRecord::Migration
  def change
    add_column :states, :tax_rate, :decimal
  end
end
