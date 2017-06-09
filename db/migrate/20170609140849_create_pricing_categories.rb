class CreatePricingCategories < ActiveRecord::Migration
  def change
    create_table :pricing_categories do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
