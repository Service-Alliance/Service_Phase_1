require 'test_helper'
require 'active_job'

class WorkOrderDeliveryServiceTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  setup do
    @work_order = work_orders(:one)
    @current_user = users(:one)
  end

  test "send out a lot of emails" do
    assert_enqueued_jobs 0
    WorkOrderDeliveryService.new(@work_order, @current_user).deliver!
    assert_enqueued_jobs 3
    perform_enqueued_jobs
    assert_equal 3, ActionMailer::Base.deliveries.count
  end
end
