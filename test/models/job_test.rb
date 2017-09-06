require 'test_helper'

class JobTest < ActiveSupport::TestCase
  setup do
    @job = jobs(:one)
  end

  test "Job#with_manager_id" do
    Job.with_manager_id(@job.job_managers.first.job_manager_id).tap do |jobs|
      assert_equal 2, jobs.count
      assert_includes jobs, @job
    end
  end
end
