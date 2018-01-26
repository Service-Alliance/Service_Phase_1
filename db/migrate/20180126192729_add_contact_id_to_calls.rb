class AddContactIdToCalls < ActiveRecord::Migration
  def change
  	add_column :calls, :contact_id, :integer
  end
end
