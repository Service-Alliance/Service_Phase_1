# == Schema Information
#
# Table name: property_types
#
#  id                :integer          not null, primary key
#  name              :string
#  structure_type_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class PropertyTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
