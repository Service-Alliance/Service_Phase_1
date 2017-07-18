# == Schema Information
#
# Table name: customer_vendors
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  vendor_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CustomerVendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
