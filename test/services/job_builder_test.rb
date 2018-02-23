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
      1,
      false
    )

    assert job.persisted?
    assert_equal 1, job.pipeline_status_id
    assert_equal 1, job.entered_by_id
  end


  test 'should detect franchise' do
    mapping = franchise_zipcodes(:one)

    [mapping.zip_code, " #{mapping.zip_code} "].each do |zip|
      job = JobBuilder.call({},{},  {'zip_code' => mapping.zip_code}, {}, 'test_company', 11, 1, false)

      assert_equal mapping.franchise, job.franchise
    end
  end
end
