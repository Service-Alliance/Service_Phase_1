require 'test_helper'

class CustomerPhonesControllerTest < ActionController::TestCase
  setup do
    @customer_phone = customer_phones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_phones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_phone" do
    assert_difference('CustomerPhone.count') do
      post :create, customer_phone: { customer_id: @customer_phone.customer_id, phone_id: @customer_phone.phone_id }
    end

    assert_redirected_to customer_phone_path(assigns(:customer_phone))
  end

  test "should show customer_phone" do
    get :show, id: @customer_phone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_phone
    assert_response :success
  end

  test "should update customer_phone" do
    patch :update, id: @customer_phone, customer_phone: { customer_id: @customer_phone.customer_id, phone_id: @customer_phone.phone_id }
    assert_redirected_to customer_phone_path(assigns(:customer_phone))
  end

  test "should destroy customer_phone" do
    assert_difference('CustomerPhone.count', -1) do
      delete :destroy, id: @customer_phone
    end

    assert_redirected_to customer_phones_path
  end
end
