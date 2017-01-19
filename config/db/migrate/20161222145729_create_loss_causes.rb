class CreateLossCauses < ActiveRecord::Migration
  def change
    create_table :loss_causes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
