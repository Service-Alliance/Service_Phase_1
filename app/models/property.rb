class Property < ActiveRecord::Base
  belongs_to :job
  has_one :customer, through: :job
  has_many :property_flooring_types
  has_many :flooring_types, through: :property_flooring_types
  belongs_to :property_type
  belongs_to :structure_type
  belongs_to :ceiling_affected, foreign_key: :ceiling_affected_id, class_name: "AffectedType"
  belongs_to :walls_affected, foreign_key: :walls_affected_id, class_name: "AffectedType"
  belongs_to :attic_affected, foreign_key: :attic_affected_id, class_name: "AffectedType"
  belongs_to :contents_affected, foreign_key: :contents_affected_id, class_name: "AffectedType"
end
