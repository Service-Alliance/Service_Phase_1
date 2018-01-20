require 'test_helper'

class WorkOrdersControllerTest < ActionController::TestCase
  def setup
    @work_order = work_orders(:one)
    sign_in(users(:one))
  end

  test '#new' do
    get :new, job_id: @work_order.job.id
    assert_response :success
  end

  test '#show' do
    get :show, id: @work_order.id, job_id: @work_order.job.id
    assert_response :success
  end

  test '#show works with no franchise on job' do
    @work_order.job.update_attributes franchise_id: nil
    get :show, id: @work_order.id, job_id: @work_order.job.id
    assert_response :success
  end

  test '#edit' do
    get :edit, id: @work_order.id, job_id: @work_order.job.id
    assert_response :success
  end

  test '#edit archived work order redirects to show' do
    @work_order.archive!
    get :edit, id: @work_order.id, job_id: @work_order.job.id
    assert_redirected_to job_work_order_path(@work_order.job, @work_order)
  end

  test "#update updates work order and saves 'published' tracker" do
    assert_difference('Tracker.count', 1) do
      patch :update, commit: 'Publish Work Order', id: @work_order.id, job_id: @work_order.job_id, work_order: @work_order.attributes
    end
    Tracker.last.tap do |t|
      assert_equal t.user, users(:one)
      assert_equal t.tracker_task, tracker_tasks(:work_order_delivered)
      assert_equal t.child_trackable, WorkOrder.last
    end
  end

  test "#create creates work order and 'drafted' tracker" do
    assert_difference('WorkOrder.count', 1) do
      assert_difference('Tracker.count', 1) do
        post :create, job_id: @work_order.job_id, work_order: @work_order.attributes
      end
    end
    Tracker.last.tap do |t|
      assert_equal t.user, users(:one)
      assert_equal t.tracker_task, tracker_tasks(:work_order_drafted)
      assert_equal t.child_trackable, WorkOrder.last
    end
  end
end
