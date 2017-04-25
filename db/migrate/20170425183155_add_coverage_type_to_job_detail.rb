class AddCoverageTypeToJobDetail < ActiveRecord::Migration
  def change
    add_column :job_details, :coverate_type, :text
  end
end
