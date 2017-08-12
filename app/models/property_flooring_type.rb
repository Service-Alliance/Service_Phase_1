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

class PropertyFlooringType < ActiveRecord::Base
  belongs_to :property
  belongs_to :flooring_type
end
