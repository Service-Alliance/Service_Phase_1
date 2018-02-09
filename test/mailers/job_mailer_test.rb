require 'test_helper'

class JobMailerTest < ActionMailer::TestCase
  def setup
    @user = users(:one)
    @to = users(:two)
    @job = jobs(:one)
  end

  test '#pricing_created' do
    email = JobMailer.pricing_created(@to, @user, pricings(:one), @job).deliver_now
    assert_equal [@to.email], email.to
    assert_equal "Pricing created for job #{@job.name || @job.id}", email.subject
  end

  test '#files_uploaded' do
    upload = @job.uploads.create(upload_category: upload_categories(:one), description: 'description')
    email = JobMailer.files_uploaded(@to, @user, upload, @job).deliver_now
    assert_equal [@to.email], email.to
    assert_equal "Files uploaded for job #{@job.name || @job.id}", email.subject
  end
end
