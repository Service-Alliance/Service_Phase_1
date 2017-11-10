class AddTimesheetsToUser < ActiveRecord::Migration
  def change
    add_column :users, :timesheets, :jsonb, default: {}, null: false
  end
end
