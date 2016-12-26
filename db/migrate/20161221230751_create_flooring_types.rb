class CreateFlooringTypes < ActiveRecord::Migration
  def change
    create_table :flooring_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
