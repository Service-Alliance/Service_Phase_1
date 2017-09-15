require 'test_helper'

class VendorAssignmentTest < ActiveSupport::TestCase
  test "it should show vendor name" do
    assignment = vendor_assignments(:one)
    assert_equal vendors(:one).name, assignment.vendor_name
  end

  test "should not blow up with nil" do
    assignment = vendor_assignments(:no_vendor)
    assert_nil assignment.vendor_name
  end
end
