class VendorLossRate < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :loss_type
end
