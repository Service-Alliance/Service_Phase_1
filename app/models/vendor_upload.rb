class VendorUpload < ActiveRecord::Base
  mount_uploader :upload, UploadUploader
end
