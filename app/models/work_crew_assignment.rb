class WorkCrewAssignment < ActiveRecord::Base
  belongs_to :work_order, required: true
  has_many :work_order_users, through: :work_order
  has_many :technicians, -> { with_role('Technician') }, through: :work_order_users, class_name: 'User', source: :user
  has_many :crew_chiefs, -> { with_role('Crew Chief') }, through: :work_order_users, class_name: 'User', source: :user
  has_one :vendor, through: :work_order_vendor
end
