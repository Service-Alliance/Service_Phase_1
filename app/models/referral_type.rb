class ReferralType < ActiveRecord::Base
  belongs_to :parent, foreign_key: :parent_id, class_name: 'ReferralType'
  has_many :sub_types, source: :parent, foreign_key: :parent_id, class_name: 'ReferralType'

  scope :root, -> {where(parent_id: nil)}

  scope :ordered, -> {order(:name)}

  delegate :name, to: :parent, allow_nil: true, prefix: true

  ASSOCIATED_RECORD_TYPES = {user: 'User', vendor: 'Vendor'}.freeze

  accepts_nested_attributes_for :sub_types
end
