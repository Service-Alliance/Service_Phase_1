require 'test_helper'

class VendorUploadTypesControllerTest < ActionController::TestCase
  setup do
    @vendor_upload_type = vendor_upload_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendor_upload_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendor_upload_type" do
    assert_difference('VendorUploadType.count') do
      post :create, vendor_upload_type: { name: @vendor_upload_type.name }
    end

    assert_redirected_to vendor_upload_type_path(assigns(:vendor_upload_type))
  end

  test "should show vendor_upload_type" do
    get :show, id: @vendor_upload_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendor_upload_type
    assert_response :success
  end

  test "should update vendor_upload_type" do
    patch :update, id: @vendor_upload_type, vendor_upload_type: { name: @vendor_upload_type.name }
    assert_redirected_to vendor_upload_type_path(assigns(:vendor_upload_type))
  end

  test "should destroy vendor_upload_type" do
    assert_difference('VendorUploadType.count', -1) do
      delete :destroy, id: @vendor_upload_type
    end

    assert_redirected_to vendor_upload_types_path
  end
end
