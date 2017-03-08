require 'test_helper'

class WorkOrdersControllerTest < ActionController::TestCase
  setup do
    @work_order = work_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_order" do
    assert_difference('WorkOrder.count') do
      post :create, work_order: { approx_time_on_loss: @work_order.approx_time_on_loss, claim_number: @work_order.claim_number, contact: @work_order.contact, crew: @work_order.crew, date: @work_order.date, franchise_location: @work_order.franchise_location, insurance: @work_order.insurance, job_id: @work_order.job_id, job_location: @work_order.job_location, job_manager_contact_info: @work_order.job_manager_contact_info, job_name: @work_order.job_name, job_start: @work_order.job_start, name: @work_order.name, referral: @work_order.referral, required: @work_order.required, scope_of_work: @work_order.scope_of_work, telphone: @work_order.telphone, to: @work_order.to, typed_by: @work_order.typed_by }
    end

    assert_redirected_to work_order_path(assigns(:work_order))
  end

  test "should show work_order" do
    get :show, id: @work_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_order
    assert_response :success
  end

  test "should update work_order" do
    patch :update, id: @work_order, work_order: { approx_time_on_loss: @work_order.approx_time_on_loss, claim_number: @work_order.claim_number, contact: @work_order.contact, crew: @work_order.crew, date: @work_order.date, franchise_location: @work_order.franchise_location, insurance: @work_order.insurance, job_id: @work_order.job_id, job_location: @work_order.job_location, job_manager_contact_info: @work_order.job_manager_contact_info, job_name: @work_order.job_name, job_start: @work_order.job_start, name: @work_order.name, referral: @work_order.referral, required: @work_order.required, scope_of_work: @work_order.scope_of_work, telphone: @work_order.telphone, to: @work_order.to, typed_by: @work_order.typed_by }
    assert_redirected_to work_order_path(assigns(:work_order))
  end

  test "should destroy work_order" do
    assert_difference('WorkOrder.count', -1) do
      delete :destroy, id: @work_order
    end

    assert_redirected_to work_orders_path
  end
end
