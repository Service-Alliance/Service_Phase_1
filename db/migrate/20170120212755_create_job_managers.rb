class CreateJobManagers < ActiveRecord::Migration
  def change
    create_table :job_managers do |t|
      t.integer :job_manager_id
      t.date :schedule_date
      t.time :start_time
      t.time :end_time
      t.integer :job_id
      t.boolean :manager_confirmation, default: false
      t.text :note

      t.timestamps null: false
    end
  end
end
