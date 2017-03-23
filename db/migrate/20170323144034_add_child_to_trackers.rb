class AddChildToTrackers < ActiveRecord::Migration
  def change
    add_column :trackers, :child_id, :integer
  end
end
