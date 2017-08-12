# == Schema Information
#
# Table name: vendor_uploads
#
#  id                    :integer          not null, primary key
#  vendor_id             :integer
#  upload                :string
#  vendor_upload_type_id :integer
#  expiration_date       :date
#  name                  :text
#  notes                 :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class VendorUpload < ActiveRecord::Base
  has_many :uploads, as: :uploadable, dependent: :destroy
  mount_uploader :upload, UploadUploader
  belongs_to :vendor_upload_type

end
