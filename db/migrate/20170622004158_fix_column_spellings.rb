class FixColumnSpellings < ActiveRecord::Migration
  def change
    rename_column :losses, :recieved_by, :received_by
    rename_column :losses, :fnol_recieved, :fnol_received
  end
end
