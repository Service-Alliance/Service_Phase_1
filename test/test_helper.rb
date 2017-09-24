ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start 'rails'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/autorun"
require "minitest/reporters"
require 'minitest/rails/capybara'
require 'capybara/poltergeist'

Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV
)


VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end

MinitestVcr::Spec.configure!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::Test::ControllerHelpers
end

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
