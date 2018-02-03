class FixFranchiseZipcodes < SeedMigration::Migration
  def up
    FranchiseZipcode.all.each do |fz|
      fz.destroy if fz.franchise.nil?
    end
    FranchiseZipcode.find_in_batches do |batch|
      batch.each{ |mapping| mapping.update_attributes assigned: true }
    end
  end

  def down

  end
end
