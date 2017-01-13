require 'test_helper'

class VendorsControllerTest < ActionController::TestCase
  setup do
    @vendor = vendors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendor" do
    assert_difference('Vendor.count') do
      post :create, vendor: { address: @vendor.address, auto: @vendor.auto, category_id: @vendor.category_id, cellphone: @vendor.cellphone, contact: @vendor.contact, email: @vendor.email, fax: @vendor.fax, independent_contractor_agreement: @vendor.independent_contractor_agreement, liability: @vendor.liability, name: @vendor.name, phone: @vendor.phone, pollution: @vendor.pollution, w9: @vendor.w9, wc: @vendor.wc }
    end

    assert_redirected_to vendor_path(assigns(:vendor))
  end

  test "should show vendor" do
    get :show, id: @vendor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendor
    assert_response :success
  end

  test "should update vendor" do
    patch :update, id: @vendor, vendor: { address: @vendor.address, auto: @vendor.auto, category_id: @vendor.category_id, cellphone: @vendor.cellphone, contact: @vendor.contact, email: @vendor.email, fax: @vendor.fax, independent_contractor_agreement: @vendor.independent_contractor_agreement, liability: @vendor.liability, name: @vendor.name, phone: @vendor.phone, pollution: @vendor.pollution, w9: @vendor.w9, wc: @vendor.wc }
    assert_redirected_to vendor_path(assigns(:vendor))
  end

  test "should destroy vendor" do
    assert_difference('Vendor.count', -1) do
      delete :destroy, id: @vendor
    end

    assert_redirected_to vendors_path
  end
end
