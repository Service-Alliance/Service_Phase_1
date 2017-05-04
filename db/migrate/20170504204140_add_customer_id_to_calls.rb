class AddCustomerIdToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :customer_id, :integer
  end
end
