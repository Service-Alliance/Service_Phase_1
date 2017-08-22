require 'test_helper'

class LossTypeTest < ActiveSupport::TestCase
  test "by_name: should lookup existing name id" do
    assert_equal(7,LossType.id("Odor"))
  end

  test "by_name: should throw an error if name is missing" do
    assert_raises(KeyError) { LossType.id("Missing") }
  end
end
