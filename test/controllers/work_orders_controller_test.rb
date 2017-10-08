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
end
