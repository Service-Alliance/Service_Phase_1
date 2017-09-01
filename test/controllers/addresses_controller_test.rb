require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @address = addresses(:one)
    sign_in(users(:one))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post :create, address: { address_1: @address.address_1, address_2: @address.address_2, address_type_id: @address.address_type_id, city: @address.city, county: @address.county, zip_code: @address.zip_code }
    end

    assert_redirected_to address_path(assigns(:address))
  end

  test "should show address" do
    get :show, id: @address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @address
    assert_response :success
  end

  test "should update address" do
    patch :update, id: @address, address: { address_1: @address.address_1, address_2: @address.address_2, address_type_id: @address.address_type_id, city: @address.city, county: @address.county, zip_code: @address.zip_code }
    assert_redirected_to address_path(assigns(:address))
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete :destroy, id: @address
    end

    assert_redirected_to addresses_path
  end
end
