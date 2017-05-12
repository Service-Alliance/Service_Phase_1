class CreateInspectionChecklists < ActiveRecord::Migration
  def change
    create_table :inspection_checklists do |t|
      t.date :estimate_will_be_sent
      t.boolean :estimate_given_verbally
      t.decimal :estimate_range, :precision => 8, :scale => 2
      t.text :notes
      t.text :next_steps
      t.boolean :send_within_one_day
      t.boolean :additional_vendor
      t.boolean :verify_information
      t.boolean :potential_construction
      t.integer :job_id

      t.timestamps null: false
    end
  end
end
