class VendorUpload < ActiveRecord::Base
  has_many :uploads, as: :uploadable, dependent: :destroy
  mount_uploader :upload, UploadUploader
  belongs_to :vendor_upload_type

end
