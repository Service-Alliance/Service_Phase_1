class Franchise < ActiveRecord::Base
  belongs_to :address
  has_many :notes, as: :noteable, dependent: :destroy
  has_many :trackers, as: :trackable, dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  has_many :jobs
  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :notes

  delegate :full_address, :address_without_county, to: :address, allow_nil: true
end
