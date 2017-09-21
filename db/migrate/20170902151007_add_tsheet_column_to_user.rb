class AddTsheetColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :tsheets, :jsonb, null: false, default: '{}'
    add_index  :users, :tsheets, using: :gin
  end
end
