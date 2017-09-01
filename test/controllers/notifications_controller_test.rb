require 'test_helper'

class NotificationsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @notification = notifications(:one)
    sign_in(users(:one))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notification" do
    assert_difference('Notification.count') do
      post :create, notification: { actor_id: @notification.actor_id, event_id: @notification.event_id, job_id: @notification.job_id, notify_text: @notification.notify_text, notify_type: @notification.notify_type, target_id: @notification.target_id }
    end

    assert_redirected_to notification_path(assigns(:notification))
  end

  test "should show notification" do
    get :show, id: @notification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notification
    assert_response :success
  end

  test "should update notification" do
    patch :update, id: @notification, notification: { actor_id: @notification.actor_id, event_id: @notification.event_id, job_id: @notification.job_id, notify_text: @notification.notify_text, notify_type: @notification.notify_type, target_id: @notification.target_id }
    assert_redirected_to notification_path(assigns(:notification))
  end

  test "should destroy notification" do
    assert_difference('Notification.count', -1) do
      delete :destroy, id: @notification
    end

    assert_redirected_to notifications_path
  end
end
