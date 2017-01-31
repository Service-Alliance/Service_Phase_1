class CreateTicsheets < ActiveRecord::Migration
  def change
    create_table :ticsheets do |t|
      t.integer :key_code
      t.string :description
      t.string :uom
      t.integer :percentage
      t.integer :quantity
      t.integer :job_id

      t.timestamps null: false
    end
  end
end
