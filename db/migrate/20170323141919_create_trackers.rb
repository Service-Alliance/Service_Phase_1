class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.references :trackable, polymorphic: true, index: true
      t.integer :tracker_task_id

      t.timestamps null: false
    end
  end
end
