require 'test_helper'

class FranchiseUsersControllerTest < ActionController::TestCase
  setup do
    @franchise_user = franchise_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:franchise_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create franchise_user" do
    assert_difference('FranchiseUser.count') do
      post :create, franchise_user: { franchise_id: @franchise_user.franchise_id, user_id: @franchise_user.user_id }
    end

    assert_redirected_to franchise_user_path(assigns(:franchise_user))
  end

  test "should show franchise_user" do
    get :show, id: @franchise_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @franchise_user
    assert_response :success
  end

  test "should update franchise_user" do
    patch :update, id: @franchise_user, franchise_user: { franchise_id: @franchise_user.franchise_id, user_id: @franchise_user.user_id }
    assert_redirected_to franchise_user_path(assigns(:franchise_user))
  end

  test "should destroy franchise_user" do
    assert_difference('FranchiseUser.count', -1) do
      delete :destroy, id: @franchise_user
    end

    assert_redirected_to franchise_users_path
  end
end
