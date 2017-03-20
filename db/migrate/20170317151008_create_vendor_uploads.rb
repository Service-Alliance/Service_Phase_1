class CreateVendorUploads < ActiveRecord::Migration
  def change
    create_table :vendor_uploads do |t|
      t.integer :vendor_id
      t.string :upload
      t.integer :vendor_upload_type_id
      t.date :expiration_date
      t.text :name
      t.text :notes

      t.timestamps null: false
    end
  end
end
