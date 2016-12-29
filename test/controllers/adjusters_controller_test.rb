require 'test_helper'

class AdjustersControllerTest < ActionController::TestCase
  setup do
    @adjuster = adjusters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adjusters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adjuster" do
    assert_difference('Adjuster.count') do
      post :create, adjuster: { address_id: @adjuster.address_id, email: @adjuster.email, first_name: @adjuster.first_name, job_id: @adjuster.job_id, last_name: @adjuster.last_name }
    end

    assert_redirected_to adjuster_path(assigns(:adjuster))
  end

  test "should show adjuster" do
    get :show, id: @adjuster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adjuster
    assert_response :success
  end

  test "should update adjuster" do
    patch :update, id: @adjuster, adjuster: { address_id: @adjuster.address_id, email: @adjuster.email, first_name: @adjuster.first_name, job_id: @adjuster.job_id, last_name: @adjuster.last_name }
    assert_redirected_to adjuster_path(assigns(:adjuster))
  end

  test "should destroy adjuster" do
    assert_difference('Adjuster.count', -1) do
      delete :destroy, id: @adjuster
    end

    assert_redirected_to adjusters_path
  end
end
