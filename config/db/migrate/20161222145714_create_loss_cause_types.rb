class CreateLossCauseTypes < ActiveRecord::Migration
  def change
    create_table :loss_cause_types do |t|
      t.integer :loss_type_id
      t.integer :loss_cause_id

      t.timestamps null: false
    end
  end
end
