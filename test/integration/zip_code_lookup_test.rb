require "integration_helper"

class JobsTest < Capybara::Rails::TestCase
  def setup
    set_up_js_test
    sign_in users(:one)
  end

  test 'zip code lookup works' do
    Geocoder.configure(lookup: :google)
    visit new_job_path
    fill_in :address_zip_code, with: '12345'
    VCR.use_cassette :zip_lookup do
      click_button :zipLookup
      wait_for_ajax
    end
    assert page.has_field?(:address_county, with: 'Rotterdam')

    click_button 'Customer Information'
    within '.modal-body' do
      fill_in :job_customer_attributes_address_attributes_zip_code, with: '12345'
      VCR.use_cassette :zip_lookup do
        click_button :customerZipLookup
        wait_for_ajax
      end
      assert page.has_field?(:job_customer_attributes_address_attributes_county, with: 'Rotterdam')
    end

    visit new_customer_path
    fill_in :customer_address_attributes_zip_code, with: '12345'
    VCR.use_cassette :zip_lookup do
      click_button :customerZipLookup
      wait_for_ajax
    end
    assert page.has_field?(:customer_address_attributes_county, with: 'Rotterdam')
  end

end
