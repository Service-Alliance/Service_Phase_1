require 'test_helper'

class CustomerVendorsControllerTest < ActionController::TestCase
  setup do
    @customer_vendor = customer_vendors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_vendors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_vendor" do
    assert_difference('CustomerVendor.count') do
      post :create, customer_vendor: { customer_id: @customer_vendor.customer_id, vendor_id: @customer_vendor.vendor_id }
    end

    assert_redirected_to customer_vendor_path(assigns(:customer_vendor))
  end

  test "should show customer_vendor" do
    get :show, id: @customer_vendor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_vendor
    assert_response :success
  end

  test "should update customer_vendor" do
    patch :update, id: @customer_vendor, customer_vendor: { customer_id: @customer_vendor.customer_id, vendor_id: @customer_vendor.vendor_id }
    assert_redirected_to customer_vendor_path(assigns(:customer_vendor))
  end

  test "should destroy customer_vendor" do
    assert_difference('CustomerVendor.count', -1) do
      delete :destroy, id: @customer_vendor
    end

    assert_redirected_to customer_vendors_path
  end
end
