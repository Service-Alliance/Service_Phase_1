require 'test_helper'

class FranchiseZipcodeTest < ActiveSupport::TestCase
  test '#detect_franchise' do
    assert_nil FranchiseZipcode.detect_franchise('66666')
    mapping = franchise_zipcodes(:one)
    assert_equal mapping.franchise.id, FranchiseZipcode.detect_franchise(mapping.zip_code)
  end
end
