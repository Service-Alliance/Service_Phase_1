require 'test_helper'

class FranchiseZipcodeBuilderTest < ActiveSupport::TestCase
  test "should build an object" do
    object = FranchiseZipcodeBuilder.call({franchise_id:'1', zip_code: '12345'})
    assert_equal 1, object.franchise_id
    assert_equal '12345', object.zip_code
    refute_nil object.city
    refute_nil object.county
  end
end
