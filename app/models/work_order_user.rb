class WorkOrderUser < ActiveRecord::Base
  belongs_to :work_order, required: true
  belongs_to :user, required: true
end
