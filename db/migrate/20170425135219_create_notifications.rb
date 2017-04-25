class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :notify_type
      t.integter :actor_id
      t.integer :target_id
      t.integer :event_id
      t.integer :job_id
      t.text :notify_text

      t.timestamps null: false
    end
  end
end
