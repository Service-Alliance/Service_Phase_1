require 'test_helper'

class NotifyTypesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @notify_type = notify_types(:one)
    sign_in(users(:one))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notify_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notify_type" do
    assert_difference('NotifyType.count') do
      post :create, notify_type: { name: @notify_type.name }
    end

    assert_redirected_to notify_type_path(assigns(:notify_type))
  end

  test "should show notify_type" do
    get :show, id: @notify_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notify_type
    assert_response :success
  end

  test "should update notify_type" do
    patch :update, id: @notify_type, notify_type: { name: @notify_type.name }
    assert_redirected_to notify_type_path(assigns(:notify_type))
  end

  test "should destroy notify_type" do
    assert_difference('NotifyType.count', -1) do
      delete :destroy, id: @notify_type
    end

    assert_redirected_to notify_types_path
  end
end
