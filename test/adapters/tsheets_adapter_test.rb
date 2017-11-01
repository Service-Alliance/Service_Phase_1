require 'test_helper'

class TsheetsAdapterTest < ActiveSupport::TestCase
  setup { @adapter = TsheetsAdapter.new }

  test "it should retrieve users" do
    VCR.use_cassette('retrieving users') do
      users = @adapter.find_users
      assert_equal 112, users.count
    end
  end

  test "timesheets" do
    VCR.use_cassette('timesheets for single user') do
      assert_difference 'EventStore.count' do
        results = TsheetsAdapter.new.timesheets('218514')
        assert_equal 2, results.first.count
      end
    end
  end

  test "verify that all correspondence is saved in ServiceMessage table" do
    VCR.use_cassette('retrieving users') do
      assert_difference('EventStore.count') { @adapter.find_users }
    end
  end
end
