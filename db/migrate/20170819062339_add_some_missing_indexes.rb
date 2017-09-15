class AddSomeMissingIndexes < ActiveRecord::Migration
  def change
    add_index :calls, :created_at
    add_index :calls, :inprogress
    add_index :contact_assignments, :job_id
    add_index :job_details, :job_id
    add_index :jobs, :created_at
    add_index :jobs, :entered_by_id
    add_index :job_managers, :job_id
    add_index :losses, :job_id
    add_index :notifications, :target_id
    add_index :occupants, :job_id
    add_index :roles, :name
    add_index :subscriptions, :job_id
    add_index :users, :role_id
    add_index :vendor_assignments, :job_id
  end
end
