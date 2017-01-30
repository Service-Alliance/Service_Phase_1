require 'test_helper'

class FranchiseZipcodesControllerTest < ActionController::TestCase
  setup do
    @franchise_zipcode = franchise_zipcodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:franchise_zipcodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create franchise_zipcode" do
    assert_difference('FranchiseZipcode.count') do
      post :create, franchise_zipcode: { franchise_id: @franchise_zipcode.franchise_id, zipcode: @franchise_zipcode.zipcode }
    end

    assert_redirected_to franchise_zipcode_path(assigns(:franchise_zipcode))
  end

  test "should show franchise_zipcode" do
    get :show, id: @franchise_zipcode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @franchise_zipcode
    assert_response :success
  end

  test "should update franchise_zipcode" do
    patch :update, id: @franchise_zipcode, franchise_zipcode: { franchise_id: @franchise_zipcode.franchise_id, zipcode: @franchise_zipcode.zipcode }
    assert_redirected_to franchise_zipcode_path(assigns(:franchise_zipcode))
  end

  test "should destroy franchise_zipcode" do
    assert_difference('FranchiseZipcode.count', -1) do
      delete :destroy, id: @franchise_zipcode
    end

    assert_redirected_to franchise_zipcodes_path
  end
end
