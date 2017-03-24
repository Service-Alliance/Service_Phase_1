class Vendor < ActiveRecord::Base
  belongs_to :category, class_name: "VendorCategory"
  has_many :vendor_uploads
end
