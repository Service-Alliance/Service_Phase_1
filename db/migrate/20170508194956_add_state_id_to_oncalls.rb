class AddStateIdToOncalls < ActiveRecord::Migration
  def change
    add_column :oncalls, :state_id, :integer
  end
end
