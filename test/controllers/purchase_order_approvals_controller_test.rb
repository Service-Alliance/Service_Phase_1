require 'test_helper'

class PurchaseOrderApprovalsControllerTest < ActionController::TestCase
  setup do
    @purchase_order_approval = purchase_order_approvals(:one)
    @job = jobs(:one)
    sign_in(users(:one))
  end

  test "should create purchase order approval and tracker task" do
    assert_difference('PurchaseOrderApproval.count', 1) do
      assert_difference('Tracker.count', 1) do
        post :create, job_id: @job.id, purchase_order_approval: @purchase_order_approval.attributes
      end
    end
    Tracker.last.tap do |t|
      assert_equal t.user, users(:one)
      assert_equal t.tracker_task, tracker_tasks(:purchase_order_created)
      assert_equal t.child_trackable, PurchaseOrderApproval.last
    end

    assert_redirected_to @job
  end
end
