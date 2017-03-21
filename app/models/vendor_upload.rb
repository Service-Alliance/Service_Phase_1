class VendorUpload < ActiveRecord::Base
  has_many :uploads, as: :uploadable, dependent: :destroy
  
end
