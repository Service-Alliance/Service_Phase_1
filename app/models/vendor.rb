class Vendor < ActiveRecord::Base
  belongs_to :category, class_name: "VendorCategory"
end
