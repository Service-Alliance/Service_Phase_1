class AddTranscriptionToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :transcription, :text
  end
end
