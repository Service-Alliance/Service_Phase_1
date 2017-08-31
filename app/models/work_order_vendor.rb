class WorkOrderVendor < ActiveRecord::Base
  belongs_to :work_order
  belongs_to :vendor
end
