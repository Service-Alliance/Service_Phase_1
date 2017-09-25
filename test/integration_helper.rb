require 'test_helper'

require 'minitest/rails/capybara'
require 'capybara/poltergeist'

Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

class Capybara::Rails::TestCase
  include SignInHelpers

  self.use_transactional_fixtures = false

  def setup
    DatabaseCleaner.start
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
    DatabaseCleaner.clean
  end

  def set_up_js_test
    Capybara.current_driver = :poltergeist
    page.driver.browser.url_whitelist = ["127.0.0.1"]
  end
end

Capybara.default_driver = :rack_test
