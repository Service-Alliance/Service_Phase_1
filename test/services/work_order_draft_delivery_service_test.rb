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
  # test 'does not send to scheduling manager if dept Construction and vendors present' do
  #   @work_order.vendor << vendor(:one)
  #   @current_user.update_attribute :department_id, departments(:construction).id
  #   WorkOrderDraftDeliveryService.new(@work_order, @current_user).deliver!
  #   assert no_mail_enqueued_for_user(users(:scheduling_manager))
  # end
end
