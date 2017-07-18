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

require 'test_helper'

class VendorUploadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
