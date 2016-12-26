class FlooringType < ActiveRecord::Base
  has_many :property_flooring_types
  has_many :properties, through: :property_flooring_types
end
