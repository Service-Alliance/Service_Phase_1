class AddPriorityToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :priority_id, :integer
    add_index :jobs, :priority_id
  end
end
