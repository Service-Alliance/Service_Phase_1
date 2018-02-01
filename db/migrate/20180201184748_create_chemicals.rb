class CreateChemicals < ActiveRecord::Migration
  def change
    create_table :chemicals do |t|
      t.integer :sp_number
      t.string :name
      t.string :purchase_unit
      t.integer :cost_per_purchase_unit
      t.integer :purchase_unit_quantity
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
