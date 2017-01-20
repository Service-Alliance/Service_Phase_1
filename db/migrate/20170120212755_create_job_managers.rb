class CreateJobManagers < ActiveRecord::Migration
  def change
    create_table :job_managers do |t|
      t.integer :job_manager_id
      t.datetime :schedule_datetime
      t.integer :job_id
      t.text :note

      t.timestamps null: false
    end
  end
end
