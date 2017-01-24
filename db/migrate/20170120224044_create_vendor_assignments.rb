class CreateVendorAssignments < ActiveRecord::Migration
  def change
    create_table :vendor_assignments do |t|
      t.integer :vendor_id
      t.integer :job_id
      t.text :note

      t.timestamps null: false
    end
  end
end
