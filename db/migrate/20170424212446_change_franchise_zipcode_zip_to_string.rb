class ChangeFranchiseZipcodeZipToString < ActiveRecord::Migration
  def self.up
      change_column :franchise_zipcodes, :zip_code, :string
    end

    def self.down
      change_column :franchise_zipcodes, :zip_code, :integer
    end
end
