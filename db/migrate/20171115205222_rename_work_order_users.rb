class DropWorkOrderUsersTable < ActiveRecord::Migration
  def change
    drop_table :work_order_users
  end
end
