require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test '#full_address' do
    assert_nil Customer.new.full_address
    assert_equal "MyString MyString MyString 1 MyString", customers(:one).full_address
  end
end
