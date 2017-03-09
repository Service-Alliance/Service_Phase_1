class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :type_id
      t.integer :status_id
      t.integer :entered_by_id
      t.integer :franchise_id
      t.text :details
      t.text :job_note
      t.integer :customer_id
      t.integer :referral_type_id
      t.boolean :emergency
      t.integer :referral_employee_id
      t.integer :corporate_referral_type_id
      t.integer :agent_id
      t.integer :adjuster_id
      t.date :recieved
      t.date :last_action

      t.timestamps null: false
    end
  end
end
