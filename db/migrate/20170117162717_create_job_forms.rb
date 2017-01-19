class CreateJobForms < ActiveRecord::Migration
  def change
    create_table :job_forms do |t|
      t.string :document_id
      t.boolean :signed
      t.string :name
      t.string :link
      t.integer :form_id
      t.integer :job_id

      t.timestamps null: false
    end
  end
end
