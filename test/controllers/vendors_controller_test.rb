require 'test_helper'

class VendorsControllerTest < ActionController::TestCase
  setup do
    @vendor = vendors(:one)
    sign_in(users(:admin))
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
      post :create, vendor: @vendor.attributes
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
    patch :update, id: @vendor, vendor: @vendor.attributes
    assert_redirected_to vendor_path(assigns(:vendor))
  end

  test "should save a tracker when updating vendor with note" do
    assert_difference 'Tracker.count', 1 do
      patch :update, id: @vendor, vendor: vendor_params_with_note(@vendor.attributes)
    end
    Tracker.last.tap do |t|
      assert_equal t.tracker_task.name, 'Note Created'
      assert_equal t.trackable, @vendor
    end
  end

  test "should save a tracker when updating vendor with attachment" do
    assert_difference 'Tracker.count', 1 do
      patch :update, id: @vendor, vendor: vendor_params_with_attachment(@vendor.attributes)
    end
    Tracker.last.tap do |t|
      assert_equal t.tracker_task.name, 'File Uploaded'
      assert_equal t.trackable, @vendor
    end
  end

  test "should destroy vendor" do
    assert_difference('Vendor.count', -1) do
      delete :destroy, id: @vendor
    end

    assert_redirected_to vendors_path
  end

  def vendor_params_with_note(attribs)
    attribs.merge(notes_attributes: [{content: 'note'}])
  end

  def vendor_params_with_attachment(attribs)
    attribs.merge(uploads_attributes: [{description: 'desc', upload_category_id: upload_categories(:one).id}])
  end
end
