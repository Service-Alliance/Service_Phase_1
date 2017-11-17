class AddTrackerTasks < SeedMigration::Migration
  def up
    TrackerTask.find_or_create_by({"name"=>"Job Created"})
    TrackerTask.find_or_create_by({"name"=>"Manager Assigned"})
    TrackerTask.find_or_create_by({"name"=>"Estimate Created"})
    TrackerTask.find_or_create_by({"name"=>"Estimate Sent"})
    TrackerTask.find_or_create_by({"name"=>"Contract Created"})
    TrackerTask.find_or_create_by({"name"=>"Contract Sent"})
    TrackerTask.find_or_create_by({"name"=>"Note Created"})
    TrackerTask.find_or_create_by({"name"=>"File Uploaded"})
    TrackerTask.find_or_create_by({"name"=>"Call Assigned"})
    TrackerTask.find_or_create_by({"name"=>"Inspection Checklist Created"})
    TrackerTask.find_or_create_by({"name"=>"Scheduler Created"})
    TrackerTask.find_or_create_by({"name"=>"Pricing Created"})
    TrackerTask.find_or_create_by({"name"=>"Work Order Drafted"})
    TrackerTask.find_or_create_by({"name"=>"Work Order Delivered"})
  end

  def down
  end
end
