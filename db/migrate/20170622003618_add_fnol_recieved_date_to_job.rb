class AddFnolRecievedDateToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :fnol_received, :datetime
  end
end
