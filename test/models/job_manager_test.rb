require 'test_helper'

class JobTest < ActiveSupport::TestCase
  test '#text_search searches user name' do
    assert_includes JobManager.text_search('dave'), job_managers(:one)
  end
end
