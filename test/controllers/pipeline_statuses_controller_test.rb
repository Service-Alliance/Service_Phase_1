require 'test_helper'

class PipelineStatusesControllerTest < ActionController::TestCase
  setup do
    @pipeline_status = pipeline_statuses(:one)
    sign_in(users(:one))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pipeline_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pipeline_status" do
    assert_difference('PipelineStatus.count') do
      post :create, pipeline_status: { name: @pipeline_status.name }
    end

    assert_redirected_to pipeline_status_path(assigns(:pipeline_status))
  end

  test "should show pipeline_status" do
    get :show, id: @pipeline_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pipeline_status
    assert_response :success
  end

  test "should update pipeline_status" do
    patch :update, id: @pipeline_status, pipeline_status: { name: @pipeline_status.name }
    assert_redirected_to pipeline_status_path(assigns(:pipeline_status))
  end

  test "should destroy pipeline_status" do
    assert_difference('PipelineStatus.count', -1) do
      delete :destroy, id: @pipeline_status
    end

    assert_redirected_to pipeline_statuses_path
  end
end
