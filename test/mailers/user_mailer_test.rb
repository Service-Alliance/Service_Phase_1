require 'test_helper'

class UserMailerTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @job = jobs(:one)
    @work_order = work_orders(:one)
  end

  test '#collections_user_added_to_job' do
    email = UserMailer.collections_user_added_to_job(@user, @job).deliver_now

    assert_equal ["user1@servpro.com"], email.to
    assert_equal "Dave Jones, you have been added as a subscriber to .", email.subject
  end


  test '#job_moved_to_invoiced' do
    email = UserMailer.job_moved_to_invoiced(@user, @job).deliver_now

    assert_equal ["user1@servpro.com"], email.to
    assert_equal "Dave Jones, has moved to invoiced.", email.subject
  end


  test '#mention_notification' do
    email = UserMailer.mention_notification(@user, @job).deliver_now

    assert_equal ["user1@servpro.com"], email.to
    assert_equal "Dave Jones, you have been mentioned on #{@job.id}, ", email.subject
  end

  test '#work_order_notification' do
    email = UserMailer.work_order_notification(@user, @job, @work_order).deliver_now

    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ["user1@servpro.com"], email.to
    assert_equal "Dave Jones, you have been sent a work order for job #{@job.id}, . Franchise: FranchiseOne.", email.subject()
  end

  test '#vendor_work_order_notification' do
    email = UserMailer.work_order_notification(@user, @job, @work_order).deliver_now

    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ["user1@servpro.com"], email.to()
    assert_equal "Dave Jones, you have been sent a work order for job #{@job.id}, . Franchise: FranchiseOne.", email.subject()
  end
end
