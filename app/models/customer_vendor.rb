# == Schema Information
#
# Table name: customer_vendors
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  vendor_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CustomerVendor < ActiveRecord::Base
  belongs_to :customer
  belongs_to :vendor
end
