require 'test_helper'

class JobManagersControllerTest < ActionController::TestCase
  setup do
    @job_manager = job_managers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_managers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_manager" do
    assert_difference('JobManager.count') do
      post :create, job_manager: { job_manager_id: @job_manager.job_manager_id, note: @job_manager.note, schedule_datetime: @job_manager.schedule_datetime }
    end

    assert_redirected_to job_manager_path(assigns(:job_manager))
  end

  test "should show job_manager" do
    get :show, id: @job_manager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_manager
    assert_response :success
  end

  test "should update job_manager" do
    patch :update, id: @job_manager, job_manager: { job_manager_id: @job_manager.job_manager_id, note: @job_manager.note, schedule_datetime: @job_manager.schedule_datetime }
    assert_redirected_to job_manager_path(assigns(:job_manager))
  end

  test "should destroy job_manager" do
    assert_difference('JobManager.count', -1) do
      delete :destroy, id: @job_manager
    end

    assert_redirected_to job_managers_path
  end
end
