class CreatePropertyFlooringTypes < ActiveRecord::Migration
  def change
    create_table :property_flooring_types do |t|
      t.integer :property_id
      t.integer :flooring_type_id

      t.timestamps null: false
    end
  end
end
