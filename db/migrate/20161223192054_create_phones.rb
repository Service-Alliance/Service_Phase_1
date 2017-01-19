class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.integer :type_id
      t.string :extension
      t.references :phoneable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
