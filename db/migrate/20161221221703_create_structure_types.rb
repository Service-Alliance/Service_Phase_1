class CreateStructureTypes < ActiveRecord::Migration
  def change
    create_table :structure_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
