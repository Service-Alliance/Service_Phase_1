class RenameWorkOrderUsers < ActiveRecord::Migration
  def change
    rename_table :work_order_users, :work_order_crew
  end
end
