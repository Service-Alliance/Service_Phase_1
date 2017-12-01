require 'test_helper'
require 'active_job'

class WorkOrderPublishDeliveryServiceTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper
  include EmailDeliveryHelper

  setup do
    @work_order = work_orders(:one)
    @current_user = users(:one)
  end

  test "send out a lot of emails" do
    assert_enqueued_jobs 0
    WorkOrderPublishDeliveryService.new(@work_order, @current_user).deliver!
    assert_enqueued_jobs 3
  end

  # test 'does not send to scheduling manager if dept Construction and vendor present' do
  #   @work_order.vendor
  #   @current_user.update_attribute :department_id, departments(:construction).id
  #   WorkOrderPublishDeliveryService.new(@work_order, @current_user).deliver!
  #   assert no_mail_enqueued_for_user(users(:scheduling_manager))
  # end

  test 'delivers to user if in work order distribution for the franchise' do
    franchises(:one).work_order_distribution << users(:two)
    @work_order.job.update_attributes franchise_id: franchises(:one).id
    WorkOrderPublishDeliveryService.new(@work_order, @current_user).deliver!
    assert mail_enqueued_for_user(users(:two))
  end

  test 'does not deliver to user if in work order distribution for another franchise' do
    franchises(:one).work_order_distribution << users(:two)
    @work_order.job.update_attributes franchise_id: franchises(:two).id
    WorkOrderPublishDeliveryService.new(@work_order, @current_user).deliver!
    assert no_mail_enqueued_for_user(users(:two))
  end

  test 'does not fail if no franchise on work order' do
    @work_order.job.update_attributes franchise_id: nil
    WorkOrderPublishDeliveryService.new(@work_order, @current_user).deliver!
  end

  #TODO: make sure vendors and all other paths are covered
end
