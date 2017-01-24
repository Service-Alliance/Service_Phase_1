require 'test_helper'

class VendorAssigmentsControllerTest < ActionController::TestCase
  setup do
    @vendor_assigment = vendor_assigments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendor_assigments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendor_assigment" do
    assert_difference('VendorAssigment.count') do
      post :create, vendor_assigment: { job_id: @vendor_assigment.job_id, note: @vendor_assigment.note, vendor_id: @vendor_assigment.vendor_id }
    end

    assert_redirected_to vendor_assigment_path(assigns(:vendor_assigment))
  end

  test "should show vendor_assigment" do
    get :show, id: @vendor_assigment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendor_assigment
    assert_response :success
  end

  test "should update vendor_assigment" do
    patch :update, id: @vendor_assigment, vendor_assigment: { job_id: @vendor_assigment.job_id, note: @vendor_assigment.note, vendor_id: @vendor_assigment.vendor_id }
    assert_redirected_to vendor_assigment_path(assigns(:vendor_assigment))
  end

  test "should destroy vendor_assigment" do
    assert_difference('VendorAssigment.count', -1) do
      delete :destroy, id: @vendor_assigment
    end

    assert_redirected_to vendor_assigments_path
  end
end
