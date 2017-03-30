class CreateUploadCategories < ActiveRecord::Migration
  def change
    create_table :upload_categories do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
