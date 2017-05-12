class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :pricing_category_id
      t.text :description

      t.timestamps null: false
    end
  end
end
