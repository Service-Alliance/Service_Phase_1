class CreateSchedulers < ActiveRecord::Migration
  def change
    create_table :schedulers do |t|
      t.date :event_date
      t.time :start_time
      t.time :end_time
      t.integer :assigned_to_user_id
      t.integer :job_id
      t.integer :scheduler_event_type_id
      t.text :notes
      t.text :title

      t.timestamps null: false
    end
  end
end
