class AddOwnerIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :owner_id, :integer
  end
end
