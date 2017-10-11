class FranchiseZipcodeAssignedMakeNotNull < ActiveRecord::Migration
  def up
    FranchiseZipcode.where(assigned: nil).find_in_batches do |batch|
      batch.each { |mapping| mapping.update_attributes(assigned: true)}
    end

    change_column :franchise_zipcodes, :assigned, :boolean, null: false, default: true
  end


  def down
    change_column :franchise_zipcodes, :assigned, :boolean

  end
end
