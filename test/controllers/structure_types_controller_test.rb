require 'test_helper'

class StructureTypesControllerTest < ActionController::TestCase
  setup do
    @structure_type = structure_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:structure_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create structure_type" do
    assert_difference('StructureType.count') do
      post :create, structure_type: { name: @structure_type.name }
    end

    assert_redirected_to structure_type_path(assigns(:structure_type))
  end

  test "should show structure_type" do
    get :show, id: @structure_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @structure_type
    assert_response :success
  end

  test "should update structure_type" do
    patch :update, id: @structure_type, structure_type: { name: @structure_type.name }
    assert_redirected_to structure_type_path(assigns(:structure_type))
  end

  test "should destroy structure_type" do
    assert_difference('StructureType.count', -1) do
      delete :destroy, id: @structure_type
    end

    assert_redirected_to structure_types_path
  end
end
