# == Schema Information
#
# Table name: structure_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StructureType < ActiveRecord::Base
  has_many :property_types
end
