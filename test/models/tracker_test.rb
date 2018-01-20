require 'test_helper'

class TrackerTest < ActiveSupport::TestCase
  def setup
  end

  test 'deleting work order with associated trackers also deletes trackers' do
    job = jobs(:one)
    wo = WorkOrder.build_from_job(job)
    wo.save
    test_deleting_child_cascades_to_tracker(job, 'Work Order Drafted', wo)
  end

  test 'deleting job manager with associated trackers also deletes trackers' do
    job = jobs(:one)
    jm = job.job_managers.create!(job_manager_id: users(:one).id)
    test_deleting_child_cascades_to_tracker(job, 'Manager Assigned', jm)
  end

  test 'deleting pricing with associated trackers also deletes trackers' do
    job = jobs(:one)
    pr = job.pricings.create!()
    test_deleting_child_cascades_to_tracker(job, 'Manager Assigned', pr)
  end

  private

  def test_deleting_child_cascades_to_tracker(trackable, tracker_type, child)
    tracker = trackable.track(tracker_type, users(:one), child)
    assert_difference 'Tracker.count', -1 do
      child.destroy
    end
    assert_nil Tracker.find_by(id: tracker.id)
  end
end
