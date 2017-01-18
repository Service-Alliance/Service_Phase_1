class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :category_type
      t.string :name
      t.string :contact
      t.string :phone
      t.string :cellphone
      t.string :fax
      t.string :address
      t.date :wc
      t.date :liability
      t.date :pollution
      t.date :auto
      t.string :w9
      t.string :independent_contractor_agreement
      t.string :email

      t.timestamps null: false
    end
  end
end
