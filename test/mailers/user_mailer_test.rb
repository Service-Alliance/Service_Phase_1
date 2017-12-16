require 'test_helper'

class UserMailerTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @job = jobs(:one)
  end

  test '#collections_user_added_to_job' do
    email = UserMailer.collections_user_added_to_job(@user, @job).deliver_now

    assert_equal ["user1@servpro.com"], email.to
    assert_equal "Dave Jones, you have been added as a subscriber to #{@job.name}.", email.subject
  end


  test '#job_moved_to_invoiced' do
    email = UserMailer.job_moved_to_invoiced(@user, @job).deliver_now

    assert_equal ["user1@servpro.com"], email.to
    assert_equal "Dave Jones, #{@job.name} has moved to invoiced.", email.subject
  end


  test '#mention_notification' do
    email = UserMailer.mention_notification(@user, @job).deliver_now

    assert_equal ["user1@servpro.com"], email.to
    assert_equal "Dave Jones, you have been mentioned on #{@job.id}, #{@job.name}", email.subject
  end
end
