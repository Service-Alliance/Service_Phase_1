# == Schema Information
#
# Table name: property_flooring_types
#
#  id               :integer          not null, primary key
#  property_id      :integer
#  flooring_type_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class PropertyFlooringTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
