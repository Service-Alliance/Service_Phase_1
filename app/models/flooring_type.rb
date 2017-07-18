# == Schema Information
#
# Table name: flooring_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FlooringType < ActiveRecord::Base
  has_many :property_flooring_types
  has_many :properties, through: :property_flooring_types
end
