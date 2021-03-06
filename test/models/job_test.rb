require 'test_helper'

class JobTest < ActiveSupport::TestCase
  setup do
    @job = jobs(:one)
  end

  test "#customer_full_address" do
    assert_equal "MyString MyString MyString NY 12345 MyString", @job.customer_full_address
  end

  test "#customer_address_without_county" do
    assert_equal "MyString MyString MyString NY 12345", @job.customer_address_without_county
  end

  test "Job#with_manager_id" do
    Job.with_manager_id(@job.job_managers.first.job_manager_id).tap do |jobs|
      assert_equal 1, jobs.count
      assert_includes jobs, @job
    end
  end

  test 'Job#value totals the value for the jobs in the relation' do
    assert_equal 19.98, Job.all.value
    assert_equal 9.99, Job.where(job_status: job_statuses(:pending)).value
  end

  test 'Job#value only takes the latest pricing for each job' do
    jobs(:pending).pricings.create!(non_taxable_amount: 15, pricing_category: pricing_categories(:one))
    assert_equal 15, Job.where(job_status: job_statuses(:pending)).value
  end

  test '#text_search searches name' do
    assert_includes Job.text_search('One'), jobs(:one)
  end
end
