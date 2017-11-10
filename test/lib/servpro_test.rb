require 'test_helper'
require_relative '../../lib/servpro'

class ServPro::UtilsTest < ActiveSupport::TestCase
  test "#seconds_to_hours" do
    assert_equal '99:02:01', ServPro::Utils.seconds_to_hours(356521)
    assert_equal '99:02:01', ServPro::Utils.seconds_to_hours('356521')
  end

  test "#seconds_to_hours without any seconds left" do
    assert_equal '99:02', ServPro::Utils.seconds_to_hours(356520)
  end
end
