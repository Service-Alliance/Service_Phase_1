class DropPipelineStatusesModel < ActiveRecord::Migration
  def change
    drop_table :pipeline_statuses
  end
end
