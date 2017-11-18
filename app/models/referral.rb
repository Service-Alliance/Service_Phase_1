class Referral < ActiveRecord::Base
  belongs_to :referral_type
  belongs_to :associated_record, polymorphic: true
  has_one :job
end
