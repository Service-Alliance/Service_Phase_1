require 'test_helper'

class AdjustersControllerTest < ActionController::TestCase
  setup do
    @adjuster = adjusters(:one)
    sign_in(users(:one))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adjusters)
  end

  test "should get edit" do
    get :edit, id: @adjuster
    assert_response :success
  end

  test "should destroy adjuster" do
    assert_difference('Adjuster.count', -1) do
      delete :destroy, id: @adjuster
    end

    assert_redirected_to adjusters_path
  end
end
