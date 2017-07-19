class CreateCollectionSubscriptions < ActiveRecord::Migration
  def change
    create_table :collection_subscriptions do |t|
      t.integer :user_id
      t.integer :job_id

      t.timestamps null: false
    end
  end
end
