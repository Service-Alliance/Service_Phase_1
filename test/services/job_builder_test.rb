require 'test_helper'

class JobBuilderTest < ActiveSupport::TestCase

  test '#call' do
    job  = JobBuilder.call(
      {},
      {},
      {},
      {},
      'test_company',
      11,
      1
    )

    assert job.persisted?
    assert_equal 1, job.pipeline_status_id
    assert_equal Date.today, job.last_action
    assert_equal 1, job.entered_by_id
  end
end
