class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.decimal :price
      t.integer :pricing_category_id
      t.text :description, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
