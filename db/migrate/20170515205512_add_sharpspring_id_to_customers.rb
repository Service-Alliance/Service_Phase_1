class AddSharpspringIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :sharpspring_id, :text
  end
end
