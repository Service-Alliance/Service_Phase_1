require 'test_helper'

class LossesControllerTest < ActionController::TestCase
  setup do
    @loss = losses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:losses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loss" do
    assert_difference('Loss.count') do
      post :create, loss: { customer_called: @loss.customer_called, electricity_available_id: @loss.electricity_available_id, fnol_recieved: @loss.fnol_recieved, loss_cause_id: @loss.loss_cause_id, loss_occurred: @loss.loss_occurred, loss_type_id: @loss.loss_type_id, recieved_by: @loss.recieved_by, source_off_id: @loss.source_off_id, standing_water_id: @loss.standing_water_id, visible_mold_id: @loss.visible_mold_id, water_available_id: @loss.water_available_id }
    end

    assert_redirected_to loss_path(assigns(:loss))
  end

  test "should show loss" do
    get :show, id: @loss
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loss
    assert_response :success
  end

  test "should update loss" do
    patch :update, id: @loss, loss: { customer_called: @loss.customer_called, electricity_available_id: @loss.electricity_available_id, fnol_recieved: @loss.fnol_recieved, loss_cause_id: @loss.loss_cause_id, loss_occurred: @loss.loss_occurred, loss_type_id: @loss.loss_type_id, recieved_by: @loss.recieved_by, source_off_id: @loss.source_off_id, standing_water_id: @loss.standing_water_id, visible_mold_id: @loss.visible_mold_id, water_available_id: @loss.water_available_id }
    assert_redirected_to loss_path(assigns(:loss))
  end

  test "should destroy loss" do
    assert_difference('Loss.count', -1) do
      delete :destroy, id: @loss
    end

    assert_redirected_to losses_path
  end
end
