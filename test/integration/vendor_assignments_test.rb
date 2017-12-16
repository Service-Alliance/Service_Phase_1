require 'integration_helper'

class VendorAssignmentsTest < Capybara::Rails::TestCase
  def setup
    set_up_js_test
    sign_in users(:one)
  end

  test 'can assign vendor to a job from vendor assignments page' do
    visit job_vendor_assignments_path(jobs(:one))
    click_link 'Add Vendor'
    wait_for_ajax

    within '.bootstrap-table' do
      first('.add-vendor').click
    end
    select('Cleaners', from: :vendor_assignment_assignment_type_id)
    assert_difference 'VendorAssignment.count' do
      click_button 'Create Vendor assignment'
    end
  end
end
