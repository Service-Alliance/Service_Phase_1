require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  setup do
    @note = notes(:one)
    @job = jobs(:one)
    sign_in(users(:one))
  end

  test "should create note and tracker task" do
    assert_difference('Note.count', 1) do
      assert_difference('Tracker.count', 1) do
        post :create, job: {job_id: @job.id}, note: @note.attributes
      end
    end
    Tracker.last.tap do |t|
      assert_equal t.user, users(:one)
      assert_equal t.tracker_task, tracker_tasks(:note_created)
      assert_equal t.child_trackable, Note.last
    end

    assert_redirected_to @job
  end
end
