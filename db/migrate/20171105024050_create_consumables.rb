class CreateConsumables < ActiveRecord::Migration
  def change
    create_table :consumables do |t|
      t.string :name, required: true
      t.string :purchase_unit, required: true
      t.integer :purchase_unit_quantity, required: true
      t.decimal :cost_per_purchase_unit, required: true

      t.timestamps null: false
    end
  end
end
