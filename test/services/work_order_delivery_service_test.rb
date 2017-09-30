require 'test_helper'

class WorkOrderDeliveryServiceTest < ActiveSupport::TestCase
  setup do
    @work_order = work_orders(:one)
    @current_user = users(:one)
  end

  test "send out a lot of emails" do
    assert_equal 0, Sidekiq::Extensions::DelayedMailer.jobs.size
    WorkOrderDeliveryService.new(@work_order, @current_user).deliver!
    assert_equal 1, Sidekiq::Extensions::DelayedMailer.jobs.size
  end
end
