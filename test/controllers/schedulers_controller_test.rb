require 'test_helper'

class SchedulersControllerTest < ActionController::TestCase
  setup do
    @scheduler = schedulers(:one)
    @job = jobs(:one)
    sign_in(users(:one))
  end

  test "should create scheduler and tracker task" do
    assert_difference('Scheduler.count', 1) do
      assert_difference('Tracker.count', 1) do
        post :create, job_id: @job.id, scheduler: @scheduler.attributes
      end
    end
    Tracker.last.tap do |t|
      assert_equal t.user, users(:one)
      assert_equal t.tracker_task, tracker_tasks(:scheduler_created)
      assert_equal t.child_trackable, Scheduler.last
    end

    assert_redirected_to @job
  end
end
