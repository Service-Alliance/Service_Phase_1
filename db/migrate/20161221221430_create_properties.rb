class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :job_id
      t.integer :property_type_id
      t.integer :structure_type_id
      t.integer :year_built
      t.integer :floors_affected
      t.integer :rooms_affected
      t.string :occured_level
      t.boolean :multi_unit
      t.integer :ceiling_affected_id
      t.integer :walls_affected_id
      t.integer :attic_affected_id
      t.integer :contents_affected_id
      t.boolean :basement_finished
      t.boolean :ownership
      t.boolean :condo

      t.timestamps null: false
    end
  end
end
