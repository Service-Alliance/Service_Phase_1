require 'test_helper'

class VendorAssignmentTest < ActiveSupport::TestCase


  test "should not blow up with nil" do
    assignment = vendor_assignments(:no_vendor)
    assert_nil assignment.vendor_name
  end
end
