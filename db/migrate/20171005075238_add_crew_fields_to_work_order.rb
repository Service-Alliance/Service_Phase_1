class AddCrewFieldsToWorkOrder < ActiveRecord::Migration
  def change
    add_column :work_orders, :number_of_technicians, :integer
    add_column :work_orders, :number_of_crew_chiefs, :integer
    add_column :work_orders, :estimated_hours, :integer
  end
end
