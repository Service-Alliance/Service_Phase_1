class ChangeCoverateTypeToCoverageType < ActiveRecord::Migration
  def change
    rename_column :job_details, :coverate_type, :coverage_type
  end
end
