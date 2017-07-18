# == Schema Information
#
# Table name: addresses
#
#  id              :integer          not null, primary key
#  address_1       :string
#  address_2       :string
#  zip_code        :string
#  city            :string
#  county          :string
#  state_id        :integer
#  address_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
