class Referral < ActiveRecord::Base
  belongs_to :referral_type
  belongs_to :associated_record, polymorphic: true
  belongs_to :employee, -> {where(associated_record_type: 'User')}, class_name: 'User', foreign_key: :associated_record_id
  has_one :job

  delegate :has_sub_types?, to: :referral_type, allow_nil: true, prefix: true

  def associated_record_collection
    associated_record_type.present? ? Object.const_get(associated_record_type).ordered : []
  end

  def referral_type_sub_types
    referral_type.present? ? referral_type.sub_types : []
  end
end
