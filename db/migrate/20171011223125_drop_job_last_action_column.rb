class DropJobLastActionColumn < ActiveRecord::Migration
  def change
    remove_column :jobs, :last_action
  end
end
