class AddUploadCategoryIdToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :upload_category_id, :integer
  end
end
