class ChangeNoteToContent < ActiveRecord::Migration
  def change
    rename_column :notes, :note, :content
  end
end
