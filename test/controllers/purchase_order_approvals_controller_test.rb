require 'test_helper'

class PurchaseOrderApprovalsControllerTest < ActionController::TestCase
  setup do
    @purchase_order_approval = purchase_order_approvals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_order_approvals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_order_approval" do
    assert_difference('PurchaseOrderApproval.count') do
      post :create, purchase_order_approval: { amount: @purchase_order_approval.amount, date: @purchase_order_approval.date, job_name: @purchase_order_approval.job_name, last_four_card: @purchase_order_approval.last_four_card, purchase_item: @purchase_order_approval.purchase_item, vendor: @purchase_order_approval.vendor }
    end

    assert_redirected_to purchase_order_approval_path(assigns(:purchase_order_approval))
  end

  test "should show purchase_order_approval" do
    get :show, id: @purchase_order_approval
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_order_approval
    assert_response :success
  end

  test "should update purchase_order_approval" do
    patch :update, id: @purchase_order_approval, purchase_order_approval: { amount: @purchase_order_approval.amount, date: @purchase_order_approval.date, job_name: @purchase_order_approval.job_name, last_four_card: @purchase_order_approval.last_four_card, purchase_item: @purchase_order_approval.purchase_item, vendor: @purchase_order_approval.vendor }
    assert_redirected_to purchase_order_approval_path(assigns(:purchase_order_approval))
  end

  test "should destroy purchase_order_approval" do
    assert_difference('PurchaseOrderApproval.count', -1) do
      delete :destroy, id: @purchase_order_approval
    end

    assert_redirected_to purchase_order_approvals_path
  end
end
