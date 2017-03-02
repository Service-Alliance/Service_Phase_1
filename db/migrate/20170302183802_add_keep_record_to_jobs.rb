class AddKeepRecordToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :keep_record, :boolean, default: false
  end
end
