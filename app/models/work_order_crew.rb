class WorkOrderCrew < ActiveRecord::Base
  self.table_name = 'work_order_crew'

  belongs_to :work_order, required: true
  belongs_to :user, required: true
end
