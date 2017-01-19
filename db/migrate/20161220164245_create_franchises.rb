class CreateFranchises < ActiveRecord::Migration
  def change
    create_table :franchises do |t|
      t.string :name
      t.integer :franchise_number
      t.string :legal_name
      t.string :phone
      t.string :fax
      t.string :website
      t.integer :address_id
      t.string :general_license
      t.string :residential_license
      t.string :commercial_license
      t.string :mold_remediation_license

      t.timestamps null: false
    end
  end
end
