require 'test_helper'

class PropertiesControllerTest < ActionController::TestCase
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post :create, property: { attic_affected: @property.attic_affected, ceiling_affected: @property.ceiling_affected, contents_affected: @property.contents_affected, floors_affected: @property.floors_affected, multi_unit: @property.multi_unit, occurred_level: @property.occurred_level, property_type_id: @property.property_type_id, rooms_affected: @property.rooms_affected, structure_type_id: @property.structure_type_id, walls_affected: @property.walls_affected, year_built: @property.year_built }
    end

    assert_redirected_to property_path(assigns(:property))
  end

  test "should show property" do
    get :show, id: @property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @property
    assert_response :success
  end

  test "should update property" do
    patch :update, id: @property, property: { attic_affected: @property.attic_affected, ceiling_affected: @property.ceiling_affected, contents_affected: @property.contents_affected, floors_affected: @property.floors_affected, multi_unit: @property.multi_unit, occurred_level: @property.occurred_level, property_type_id: @property.property_type_id, rooms_affected: @property.rooms_affected, structure_type_id: @property.structure_type_id, walls_affected: @property.walls_affected, year_built: @property.year_built }
    assert_redirected_to property_path(assigns(:property))
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete :destroy, id: @property
    end

    assert_redirected_to properties_path
  end
end
