class AddChildTrackableToTrackers < ActiveRecord::Migration
  def up
    add_column :trackers, :child_trackable_id, :integer
    add_column :trackers, :child_trackable_type, :string

    # Copy child_id to child_trackable_id

    Tracker.find_each do |tracker|

      tracker.child_trackable = Note.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'Note Created'
      tracker.child_trackable = Upload.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'File Uploaded'
      tracker.child_trackable = Call.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'Call Assigned'
      tracker.child_trackable = WorkOrder.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'Work Order Drafted'
      tracker.child_trackable = WorkOrder.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'Work Order Delivered'
      tracker.child_trackable = Job.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'Job Created'
      tracker.child_trackable = Job.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'Estimate Created'
      tracker.child_trackable = Job.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'Estimate Sent'
      tracker.child_trackable = Job.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'Contract Created'
      tracker.child_trackable = Job.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'Contract Sent'
      tracker.child_trackable = JobManager.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'Manager Assigned'
      tracker.child_trackable = InspectionChecklist.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'Inspection Checklist Created'
      tracker.child_trackable = Scheduler.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'Scheduler Created'
      tracker.child_trackable = Pricing.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'Pricing Created'
      tracker.child_trackable = PurchaseOrderApproval.find_by(id: tracker.child_id) if tracker.tracker_task.name == 'Purchase Order Created'

      tracker.save!
    end

    # delete trackers with missing children 
    Tracker.where(child_trackable_id: nil).where.not(child_id: nil).delete_all

    add_index :trackers, [:child_trackable_id, :child_trackable_type]
  end

  def down
    remove_index :trackers, [:child_trackable_id, :child_trackable_type]
    remove_column :trackers, :child_trackable_id
    remove_column :trackers, :child_trackable_type
  end
end
