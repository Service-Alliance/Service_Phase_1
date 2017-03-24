class AddCoordinatorIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :coordinator_id, :integer
  end
end
