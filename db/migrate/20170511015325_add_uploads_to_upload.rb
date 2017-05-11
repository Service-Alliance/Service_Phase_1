class AddUploadsToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :uploads, :json
  end
end
