class AddAssignmentTypeIdToVendorAssignments < ActiveRecord::Migration
  def change
    add_column :vendor_assignments, :assignment_type_id, :integer
  end
end
