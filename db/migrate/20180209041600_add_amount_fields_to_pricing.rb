class AddAmountFieldsToPricing < ActiveRecord::Migration
  def up
    Pricing.where(price: nil).update_all(price: 0)
    rename_column :pricings, :price, :non_taxable_amount
    change_column_default :pricings, :non_taxable_amount, 0
    change_column_null :pricings, :non_taxable_amount, false
    add_column :pricings, :taxable_amount, :decimal, default: 0, null: false
    add_column :pricings, :tax_amount, :decimal, default: 0, null: false
  end

  def down
    change_column_default :pricings, :non_taxable_amount, nil
    change_column_null :pricings, :non_taxable_amount, true
    rename_column :pricings, :non_taxable_amount, :price
    remove_column :pricings, :taxable_amount
    remove_column :pricings, :tax_amount
  end
end
