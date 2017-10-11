require 'test_helper'

class FranchiseZipcodeTest < ActiveSupport::TestCase
  setup do
    @assigned = franchise_zipcodes(:one)
    @unassigned = franchise_zipcodes(:unassigned)
  end

  test "#detect_franchise should return nil if missing" do
    assert_nil FranchiseZipcode.detect_franchise('66666')
  end

  test 'should not return for unassigned' do
    assert_nil FranchiseZipcode.detect_franchise(@unassigned.zip_code)
  end

  test '#detect_franchise' do
    assert_equal @assigned.franchise.id, FranchiseZipcode.detect_franchise(@assigned.zip_code)
  end
end
