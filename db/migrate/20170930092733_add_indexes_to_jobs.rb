class AddIndexesToJobs < ActiveRecord::Migration
  def change
    add_index :jobs, :fnol_received
    add_index :jobs, :status_id
    add_index :jobs, :franchise_id
    add_index :jobs, :customer_id
    add_index :jobs, :referral_type_id
    add_index :jobs, :referral_employee_id
    add_index :jobs, :corporate_referral_type_id
    add_index :jobs, :agent_id
    add_index :jobs, :adjuster_id
    add_index :jobs, :coordinator_id
  end
end
