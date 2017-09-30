require 'test_helper'

class WorkOrderMailerTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @job = jobs(:one)
    @work_order = work_orders(:one)
  end

  test '#work_order_notification' do
    assert_difference 'MailLog.count' do
      email = WorkOrderMailer.notification(@user, @job, @work_order).deliver_now
      assert_not ActionMailer::Base.deliveries.empty?
      assert_equal ["user1@servpro.com"], email.to
      assert_equal "Dave Jones, you have been sent a work order for job #{@job.id}, . Franchise: FranchiseOne.", email.subject()
    end
  end

  test '#vendor_work_order_notification' do
    assert_difference 'MailLog.count' do
      email = WorkOrderMailer.notification(@user, @job, @work_order).deliver_now
      assert_not ActionMailer::Base.deliveries.empty?
      assert_equal ["user1@servpro.com"], email.to()
      assert_equal "Dave Jones, you have been sent a work order for job #{@job.id}, . Franchise: FranchiseOne.", email.subject()
    end
  end
end
