class AddNoteToTracker < ActiveRecord::Migration
  def change
    add_column :trackers, :note, :text
  end
end
