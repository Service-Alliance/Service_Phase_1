require 'test_helper'

class SchedulersControllerTest < ActionController::TestCase
  setup do
    @scheduler = schedulers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedulers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scheduler" do
    assert_difference('Scheduler.count') do
      post :create, scheduler: { assigned_to_user_id: @scheduler.assigned_to_user_id, end_time: @scheduler.end_time, event_date: @scheduler.event_date, job_id: @scheduler.job_id, notes: @scheduler.notes, scheduler_event_type_id: @scheduler.scheduler_event_type_id, start_time: @scheduler.start_time, title: @scheduler.title }
    end

    assert_redirected_to scheduler_path(assigns(:scheduler))
  end

  test "should show scheduler" do
    get :show, id: @scheduler
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scheduler
    assert_response :success
  end

  test "should update scheduler" do
    patch :update, id: @scheduler, scheduler: { assigned_to_user_id: @scheduler.assigned_to_user_id, end_time: @scheduler.end_time, event_date: @scheduler.event_date, job_id: @scheduler.job_id, notes: @scheduler.notes, scheduler_event_type_id: @scheduler.scheduler_event_type_id, start_time: @scheduler.start_time, title: @scheduler.title }
    assert_redirected_to scheduler_path(assigns(:scheduler))
  end

  test "should destroy scheduler" do
    assert_difference('Scheduler.count', -1) do
      delete :destroy, id: @scheduler
    end

    assert_redirected_to schedulers_path
  end
end
