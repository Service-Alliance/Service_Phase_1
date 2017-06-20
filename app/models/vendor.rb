class Vendor < ActiveRecord::Base
  belongs_to :category, class_name: "VendorCategory"
  has_many :vendor_uploads
  has_many :notes, as: :noteable, dependent: :destroy
  has_many :trackers, as: :trackable, dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  has_many :customer_vendors
  has_many :customers, through: :customer_vendors
  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :notes
end
