require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @job = jobs(:with_note)
    @note = notes(:one)
    sign_in(users(:one))
  end

  test "should get index" do
    get :index, job_id: @job.id
    assert_response :success
    assert_not_nil assigns(:notes)
  end

  test "should get new" do
    get :new, job_id: @job.id
    assert_response :success
  end

  test "should create note" do
    assert_difference('Note.count') do
      post :create, job_id: @job.id, note: { note: @job.job_note }
    end

    assert_redirected_to note_path(assigns(:note))
  end

  test "should update note" do
    patch :update, job_id: @job, note: { note: @job.job_note}
    assert_redirected_to note_path(assigns(:note))
  end
end
