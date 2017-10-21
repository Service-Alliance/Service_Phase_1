class WorkShift < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :work_order, required: true
  has_many :breaks, class_name: 'WorkShiftBreak'
  accepts_nested_attributes_for :breaks, reject_if: :all_blank, allow_destroy: true
end
