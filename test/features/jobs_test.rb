require "test_helper"

class JobsTest < Capybara::Rails::TestCase
  def setup
    set_up_js_test
    sign_in users(:one)
  end

  def add_loss
    click_button 'Loss Information'
  end

  def add_property
    click_button 'Property Information'
  end

  def add_billing
    click_button 'Billing Information'
  end

  test 'can create a job' do
    visit root_path
    click_link 'New Job'
    fill_in :company_name, with: 'Company Name'
    fill_in :caller_first_name, with: 'Callerfname'
    fill_in :caller_last_name, with: 'Callerlname'
    #within '.referrals', match: :first do
      #choose('Internet')
      #find('#job_referral_type_id_2').click
    #end
    click_button 'Create Job'
  end
end
