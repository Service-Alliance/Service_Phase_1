class WorkOrderVendor < ActiveRecord::Base
  belongs_to :work_order, required: true
  belongs_to :vendor, required: true
end
