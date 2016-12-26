require 'test_helper'

class CallersControllerTest < ActionController::TestCase
  setup do
    @caller = callers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:callers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caller" do
    assert_difference('Caller.count') do
      post :create, caller: { address_id: @caller.address_id, email: @caller.email, first_name: @caller.first_name, job_id: @caller.job_id, last_name: @caller.last_name }
    end

    assert_redirected_to caller_path(assigns(:caller))
  end

  test "should show caller" do
    get :show, id: @caller
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caller
    assert_response :success
  end

  test "should update caller" do
    patch :update, id: @caller, caller: { address_id: @caller.address_id, email: @caller.email, first_name: @caller.first_name, job_id: @caller.job_id, last_name: @caller.last_name }
    assert_redirected_to caller_path(assigns(:caller))
  end

  test "should destroy caller" do
    assert_difference('Caller.count', -1) do
      delete :destroy, id: @caller
    end

    assert_redirected_to callers_path
  end
end
