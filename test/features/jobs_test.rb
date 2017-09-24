require "test_helper"

class JobsTest < Capybara::Rails::TestCase
  def setup
    set_up_js_test
    sign_in users(:one)
  end

  def add_loss
    click_button 'Loss Information'
    within '.modal-body' do
      
    end
    within '.modal-footer' do
      click_button 'Close'
    end
  end

  def add_property
    click_button 'Property Information'
    within '.modal-body' do
      
    end
    within '.modal-footer' do
      click_button 'Close'
    end
  end

  def add_billing
    click_button 'Billing Information'
    within '.modal-body' do
      
    end
    within '.modal-footer' do
      click_button 'Close'
    end
  end

  def add_customer
    click_button 'Customer Information'
    within '.modal-body' do
      
    end
    within '.modal-footer' do
      click_button 'Close'
    end
  end

  test 'can create a job' do
    visit root_path
    click_link 'New Job'
    fill_in :company_name, with: 'Company Name'
    fill_in :caller_first_name, with: 'Callerfname'
    fill_in :caller_last_name, with: 'Callerlname'
    add_loss
    add_property
    add_billing
    add_customer
    #within '.referrals', match: :first do
      #choose('Internet')
      #find('#job_referral_type_id_2').click
    #end
    click_button 'Create Job'
    assert_content 'Job was successfully created'

    job = Job.last
    assert job.caller.companies.find_by(name: 'Company Name')
    assert_equal 'Callerfname', job.caller.first_name
    assert_equal 'Callerlname', job.caller.last_name
  end
end
