require 'test_helper'

class PrioritiesControllerTest < ActionController::TestCase
  setup do
    sign_in(users(:one))
    @priority = priorities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:priorities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create priority" do
    assert_difference('Priority.count') do
      post :create, priority: { context: @priority.context, name: @priority.name, priority: @priority.priority }
    end

    assert_redirected_to priority_path(assigns(:priority))
  end

  test "should show priority" do
    get :show, id: @priority
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @priority
    assert_response :success
  end

  test "should update priority" do
    patch :update, id: @priority, priority: { context: @priority.context, name: @priority.name, priority: @priority.priority }
    assert_redirected_to priority_path(assigns(:priority))
  end

  test "should destroy priority" do
    assert_difference('Priority.count', -1) do
      delete :destroy, id: @priority
    end

    assert_redirected_to priorities_path
  end
end
