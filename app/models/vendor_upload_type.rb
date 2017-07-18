# == Schema Information
#
# Table name: vendor_upload_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VendorUploadType < ActiveRecord::Base
end
