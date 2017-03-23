class CreateTrackerTasks < ActiveRecord::Migration
  def change
    create_table :tracker_tasks do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
