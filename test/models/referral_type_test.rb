require 'test_helper'

class ReferralTypeTest < ActiveSupport::TestCase
  test 'root scope should not return sub types' do
    root_types = ReferralType.root
    assert_includes root_types, referral_types(:parent)
    refute_includes root_types, referral_types(:sub_type)
  end
end
