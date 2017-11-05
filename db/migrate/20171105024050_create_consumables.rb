class CreateConsumables < ActiveRecord::Migration
  def change
    create_table :consumables do |t|
      t.string :name
      t.string :purchase_unit
      t.decimal :cost_per_purchase_unit
      t.decimal :cost_per_unit

      t.timestamps null: false
    end
  end
end
