require 'test_helper'

class PricingCategoriesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @pricing_category = pricing_categories(:one)
    sign_in(users(:one))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pricing_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pricing_category" do
    assert_difference('PricingCategory.count') do
      post :create, pricing_category: { name: @pricing_category.name }
    end

    assert_redirected_to pricing_category_path(assigns(:pricing_category))
  end

  test "should show pricing_category" do
    get :show, id: @pricing_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pricing_category
    assert_response :success
  end

  test "should update pricing_category" do
    patch :update, id: @pricing_category, pricing_category: { name: @pricing_category.name }
    assert_redirected_to pricing_category_path(assigns(:pricing_category))
  end

  test "should destroy pricing_category" do
    assert_difference('PricingCategory.count', -1) do
      delete :destroy, id: @pricing_category
    end

    assert_redirected_to pricing_categories_path
  end
end
