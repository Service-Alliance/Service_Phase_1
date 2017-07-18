# == Schema Information
#
# Table name: properties
#
#  id                   :integer          not null, primary key
#  job_id               :integer
#  property_type_id     :integer
#  structure_type_id    :integer
#  year_built           :integer
#  floors_affected      :integer
#  rooms_affected       :integer
#  occurred_level       :string
#  multi_unit           :boolean
#  ceiling_affected_id  :integer
#  walls_affected_id    :integer
#  attic_affected_id    :integer
#  contents_affected_id :integer
#  basement_finished    :boolean
#  ownership            :boolean
#  condo                :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
