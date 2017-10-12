class WorkShift < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :work_order, required: true
end
