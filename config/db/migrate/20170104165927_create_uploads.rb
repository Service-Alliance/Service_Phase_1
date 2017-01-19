class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.integer :job_id
      t.string :upload

      t.timestamps null: false
    end
  end
end
