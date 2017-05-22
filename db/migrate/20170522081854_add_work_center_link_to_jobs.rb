class AddWorkCenterLinkToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :work_center_link, :text
  end
end
