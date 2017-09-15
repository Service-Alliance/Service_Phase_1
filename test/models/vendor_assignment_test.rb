require 'test_helper'

class VendorAssignmentTest < ActiveSupport::TestCase
  setup do
    @assignment = vendor_assignments(:one)
  end

  test "it should show vendor name" do
    assert_equal vendors(:one).name, @assignment.vendor_name
  end

  test "should not blow up with nil" do
    assignment = vendor_assignments(:no_vendor)
    assert_nil assignment.vendor_name
  end
end
