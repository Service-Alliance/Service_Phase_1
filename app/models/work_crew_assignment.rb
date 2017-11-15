class WorkCrewAssignment < ActiveRecord::Base
  belongs_to :work_order, required: true
  has_and_belongs_to_many :work_order_crew_members, through: :work_order
  has_and_belongs_to_many :technicians, -> { with_role('Technician') }, through: :work_order_crew_members, class_name: 'User', source: :user
  has_and_belongs_to_many :crew_chiefs, -> { with_role('Crew Chief') }, through: :work_order_crew_members, class_name: 'User', source: :user
  has_one :vendor, through: :work_order_vendor_assignment, class_name: 'Vendor', source: :vendor, required: false

    def technician_names
    technicians.map(&:full_name)
  end

  def crew_chief_names
    crew_chiefs.map(&:full_name)
  end
end
