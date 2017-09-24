require "test_helper"

class JobsTest < Capybara::Rails::TestCase
  def setup
    set_up_js_test
    sign_in users(:one)
  end

  test 'can create a job' do
    visit root_path
    click_link 'New Job'
    save_and_open_page

  end
end
