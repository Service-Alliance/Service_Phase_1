class CreatePipelineStatuses < ActiveRecord::Migration
  def change
    create_table :pipeline_statuses do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
