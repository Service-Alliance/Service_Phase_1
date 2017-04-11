class AddPipelineStatusIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :pipeline_status_id, :integer
  end
end
