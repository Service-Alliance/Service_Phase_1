require 'test_helper'

class VendorUploadsControllerTest < ActionController::TestCase
  setup do
    @vendor_upload = vendor_uploads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendor_uploads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendor_upload" do
    assert_difference('VendorUpload.count') do
      post :create, vendor_upload: { expiration_date: @vendor_upload.expiration_date, name: @vendor_upload.name, notes: @vendor_upload.notes, upload: @vendor_upload.upload, vendor_id: @vendor_upload.vendor_id, vendor_upload_type_id: @vendor_upload.vendor_upload_type_id }
    end

    assert_redirected_to vendor_upload_path(assigns(:vendor_upload))
  end

  test "should show vendor_upload" do
    get :show, id: @vendor_upload
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendor_upload
    assert_response :success
  end

  test "should update vendor_upload" do
    patch :update, id: @vendor_upload, vendor_upload: { expiration_date: @vendor_upload.expiration_date, name: @vendor_upload.name, notes: @vendor_upload.notes, upload: @vendor_upload.upload, vendor_id: @vendor_upload.vendor_id, vendor_upload_type_id: @vendor_upload.vendor_upload_type_id }
    assert_redirected_to vendor_upload_path(assigns(:vendor_upload))
  end

  test "should destroy vendor_upload" do
    assert_difference('VendorUpload.count', -1) do
      delete :destroy, id: @vendor_upload
    end

    assert_redirected_to vendor_uploads_path
  end
end
