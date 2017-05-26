class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.text :name
      t.integer :address_id

      t.timestamps null: false
    end
  end
end
