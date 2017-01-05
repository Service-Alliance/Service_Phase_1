class CreatePropertyTypes < ActiveRecord::Migration
  def change
    create_table :property_types do |t|
      t.string :name
      t.integer :structure_type_id

      t.timestamps null: false
    end
  end
end
