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
  end

  test 'delivers to the scheduling manager normally' do
    WorkOrderDeliveryService.new(@work_order, @current_user).deliver!
    assert mail_enqueued_for_user(users(:scheduling_manager))
  end

  test 'does not send to scheduling manager if dept Construction and vendors present' do
    @work_order.vendors << vendors(:one)
    @current_user.update_attribute :department_id, departments(:construction).id
    WorkOrderDeliveryService.new(@work_order, @current_user).deliver!
    assert no_mail_enqueued_for_user(users(:scheduling_manager))
  end

  def mail_enqueued_for_user(user)
    user_id = user.to_global_id.to_s
    jobs = enqueued_jobs.select{ |j| j[:args][3]["_aj_globalid"] == user_id }
    jobs.size > 0
  end

  def no_mail_enqueued_for_user(user)
    !mail_enqueued_for_user(user)
  end
end
