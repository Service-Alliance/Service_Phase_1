class CreateLossTypes < ActiveRecord::Migration
  def change
    create_table :loss_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
