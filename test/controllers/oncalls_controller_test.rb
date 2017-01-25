require 'test_helper'

class OncallsControllerTest < ActionController::TestCase
  setup do
    @oncall = oncalls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:oncalls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create oncall" do
    assert_difference('Oncall.count') do
      post :create, oncall: { priority: @oncall.priority, scheduled_on: @oncall.scheduled_on, user_id: @oncall.user_id }
    end

    assert_redirected_to oncall_path(assigns(:oncall))
  end

  test "should show oncall" do
    get :show, id: @oncall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @oncall
    assert_response :success
  end

  test "should update oncall" do
    patch :update, id: @oncall, oncall: { priority: @oncall.priority, scheduled_on: @oncall.scheduled_on, user_id: @oncall.user_id }
    assert_redirected_to oncall_path(assigns(:oncall))
  end

  test "should destroy oncall" do
    assert_difference('Oncall.count', -1) do
      delete :destroy, id: @oncall
    end

    assert_redirected_to oncalls_path
  end
end
