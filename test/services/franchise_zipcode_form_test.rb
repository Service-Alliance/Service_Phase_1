require 'test_helper'

class FranchiseZipcodeFormTest < ActiveSupport::TestCase
  test "should build an object" do
    object = FranchiseZipcodeForm.call({ franchise_id: '1', zip_code: '12345' })
    assert_equal 1, object.franchise_id
    assert_equal '12345', object.zip_code
    refute_nil object.county
  end
end
