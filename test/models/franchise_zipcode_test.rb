# == Schema Information
#
# Table name: franchise_zipcodes
#
#  id           :integer          not null, primary key
#  franchise_id :integer
#  zip_code     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  city         :string
#  county       :string
#  assigned     :boolean
#

require 'test_helper'

class FranchiseZipcodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
