class CreateFranchiseZipcodes < ActiveRecord::Migration
  def change
    create_table :franchise_zipcodes do |t|
      t.integer :franchise_id
      t.integer :zip_code

      t.timestamps null: false
    end
  end
end
