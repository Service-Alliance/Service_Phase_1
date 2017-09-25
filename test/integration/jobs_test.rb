require "integration_helper"

class JobsTest < Capybara::Rails::TestCase
  def setup
    set_up_js_test
    sign_in users(:one)
  end

  test 'can create a job and then edit it' do
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

    assert_equal 1, job.losses.count
    job.losses.first.tap do |loss|
      #assert_equal 'Liability', loss.loss_type.name
      assert_equal 'Loss Note', loss.notes
    end

    job.property.tap do |property|
      assert_equal 2, property.floors_affected
    end

    job.customer.tap do |customer|
      assert_equal 'Customerfname', customer.first_name
      assert_equal 'Customerlname', customer.last_name
    end

    job.job_detail.tap do |job_detail|
      assert_equal 'claim', job_detail.claim_number
    end

    edit_job_franchise

    job = Job.last
    assert_equal 'FranchiseOne', job.franchise_name
  end


  def edit_job_franchise
    click_link 'Edit Job'
    find('#job_franchise_id').find(:xpath, 'option[2]').select_option
    click_button 'submit-job'
  end

  def add_loss
    click_button 'Loss Information'
    within '.modal-body' do
      # TODO: test Dates
      # TODO: test radios
      fill_in 'Notes', with: 'Loss Note'
    end
    within '.modal-footer' do
      click_button 'Close'
    end
  end

  def add_property
    click_button 'Property Information'
    within '.modal-body' do
      #select 'Residential', from: :job_property_attributes_structure_type_id, visible: false
      fill_in '# Floors Affected', with: '2'
    end
    within '.modal-footer' do
      click_button 'Close'
    end
  end

  def add_billing
    click_button 'Billing Information'
    within '.modal-body' do
      #select InsuranceCompany.first.name, from: 'Insurance company'
      fill_in 'Claim number', with: 'claim'
    end
    within '.modal-footer' do
      click_button 'Close'
    end
  end

  def add_customer
    click_button 'Customer Information'
    within '.modal-body' do
      fill_in 'First name', with: 'Customerfname'
      fill_in 'Last name', with: 'Customerlname'
    end
    within '.modal-footer' do
      click_button 'Close'
    end
  end
end
