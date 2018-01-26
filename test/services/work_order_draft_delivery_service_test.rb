require 'test_helper'
require 'active_job'

class WorkOrderDraftDeliveryServiceTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper
  include EmailDeliveryHelper

  setup do
    @work_order = work_orders(:one)
    @current_user = users(:one)
  end

  # test "send out a lot of emails" do
  #   assert_enqueued_jobs 1
  #   WorkOrderDraftDeliveryService.new(@work_order, @current_user).deliver!
  #   assert_enqueued_jobs 3
  # end

  test 'sends to scheduling manager for franchise' do
    WorkOrderDraftDeliveryService.new(@work_order, @current_user).deliver!
    assert mail_enqueued_for_user(users(:fr1_scheduling_manager))
    assert no_mail_enqueued_for_user(users(:fr2_scheduling_manager))
  end

  # test 'does not send to scheduling manager if dept Construction and vendors present' do
  #   @work_order.vendor << vendor(:one)
  #   @current_user.update_attribute :department_id, departments(:construction).id
  #   WorkOrderDraftDeliveryService.new(@work_order, @current_user).deliver!
  #   assert no_mail_enqueued_for_user(users(:scheduling_manager))
  # end

  #TODO: make sure vendors and all other paths are covered
end
