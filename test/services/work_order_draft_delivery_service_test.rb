require 'test_helper'
require 'active_job'

class WorkOrderDraftDeliveryServiceTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper
  include EmailDeliveryHelper

  setup do
    @work_order = work_orders(:one)
    @current_user = users(:one)
  end

  test 'sends to scheduling manager' do
    WorkOrderDraftDeliveryService.new(@work_order, @current_user).deliver!
    assert mail_enqueued_for_user(users(:scheduling_manager))
  end
end
