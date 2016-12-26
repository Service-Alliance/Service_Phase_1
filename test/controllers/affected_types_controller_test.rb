require 'test_helper'

class AffectedTypesControllerTest < ActionController::TestCase
  setup do
    @affected_type = affected_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:affected_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create affected_type" do
    assert_difference('AffectedType.count') do
      post :create, affected_type: { name: @affected_type.name }
    end

    assert_redirected_to affected_type_path(assigns(:affected_type))
  end

  test "should show affected_type" do
    get :show, id: @affected_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @affected_type
    assert_response :success
  end

  test "should update affected_type" do
    patch :update, id: @affected_type, affected_type: { name: @affected_type.name }
    assert_redirected_to affected_type_path(assigns(:affected_type))
  end

  test "should destroy affected_type" do
    assert_difference('AffectedType.count', -1) do
      delete :destroy, id: @affected_type
    end

    assert_redirected_to affected_types_path
  end
end
