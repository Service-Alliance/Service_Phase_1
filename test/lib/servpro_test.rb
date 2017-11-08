require 'test_helper'
require_relative '../../lib/servpro'

class ServPro::UtilsTest < ActiveSupport::TestCase

  test "#seconds_to_hours" do
    assert_equal '99:2:1', ServPro::Utils.seconds_to_hours(356521)
  end
end
