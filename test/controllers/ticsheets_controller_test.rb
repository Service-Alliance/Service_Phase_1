require 'test_helper'

class TicsheetsControllerTest < ActionController::TestCase
  setup do
    @ticsheet = ticsheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ticsheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticsheet" do
    assert_difference('Ticsheet.count') do
      post :create, ticsheet: { description: @ticsheet.description, key_code: @ticsheet.key_code, percentage: @ticsheet.percentage, quantity: @ticsheet.quantity, uom: @ticsheet.uom }
    end

    assert_redirected_to ticsheet_path(assigns(:ticsheet))
  end

  test "should show ticsheet" do
    get :show, id: @ticsheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ticsheet
    assert_response :success
  end

  test "should update ticsheet" do
    patch :update, id: @ticsheet, ticsheet: { description: @ticsheet.description, key_code: @ticsheet.key_code, percentage: @ticsheet.percentage, quantity: @ticsheet.quantity, uom: @ticsheet.uom }
    assert_redirected_to ticsheet_path(assigns(:ticsheet))
  end

  test "should destroy ticsheet" do
    assert_difference('Ticsheet.count', -1) do
      delete :destroy, id: @ticsheet
    end

    assert_redirected_to ticsheets_path
  end
end
