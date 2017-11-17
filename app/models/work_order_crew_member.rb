class WorkOrderCrewMember < ActiveRecord::Base
  belongs_to :work_order, required: true
  belongs_to :user, required: true
  has_many :work_crew_assignments
end
