class FixFranchiseZipcodes < SeedMigration::Migration
  def up
    FranchiseZipcode.all.each do |fz|
      fz.destroy if fz.franchise.nil?
    end
  end

  def down

  end
end
