class ChangeZipToString < ActiveRecord::Migration
  def self.up
      change_column :addresses, :zip_code, :string
    end

    def self.down
      change_column :addresses, :zip_code, :integer
    end
end
