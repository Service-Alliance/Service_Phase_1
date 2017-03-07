class CreateContactAssignments < ActiveRecord::Migration
  def change
    create_table :contact_assignments do |t|
      t.integer :contact_id
      t.integer :job_id
      t.text :note

      t.timestamps null: false
    end
  end
end
