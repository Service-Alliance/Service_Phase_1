class CreateLosses < ActiveRecord::Migration
  def change
    create_table :losses do |t|
      t.string :received_by
      t.datetime :loss_occurred
      t.datetime :fnol_received
      t.date :customer_called
      t.integer :job_id
      t.integer :loss_type_id
      t.integer :loss_cause_id
      t.integer :standing_water_id
      t.integer :water_available_id
      t.integer :electricity_available_id
      t.integer :source_off_id
      t.integer :visible_mold_id
      t.text :source_cause
      t.integer :previous_water_damage_id
      t.text :cleaning_type
      t.string :affected_square_footage

      t.text :notes

      t.timestamps null: false
    end
  end
end
