class CreateVendorUploadTypes < ActiveRecord::Migration
  def change
    create_table :vendor_upload_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
