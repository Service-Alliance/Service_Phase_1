require 'test_helper'

class TrackersControllerTest < ActionController::TestCase
  setup do
    @tracker = trackers(:job_created)
    sign_in(users(:one))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trackers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end


  test "should show tracker" do
    get :show, id: @tracker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tracker
    assert_response :success
  end
end
