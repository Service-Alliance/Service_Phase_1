require 'test_helper'

class VendorCategoriesControllerTest < ActionController::TestCase
  setup do
    @vendor_category = vendor_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendor_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendor_category" do
    assert_difference('VendorCategory.count') do
      post :create, vendor_category: { name: @vendor_category.name }
    end

    assert_redirected_to vendor_category_path(assigns(:vendor_category))
  end

  test "should show vendor_category" do
    get :show, id: @vendor_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendor_category
    assert_response :success
  end

  test "should update vendor_category" do
    patch :update, id: @vendor_category, vendor_category: { name: @vendor_category.name }
    assert_redirected_to vendor_category_path(assigns(:vendor_category))
  end

  test "should destroy vendor_category" do
    assert_difference('VendorCategory.count', -1) do
      delete :destroy, id: @vendor_category
    end

    assert_redirected_to vendor_categories_path
  end
end
