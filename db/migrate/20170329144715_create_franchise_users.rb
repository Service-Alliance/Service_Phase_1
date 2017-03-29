class CreateFranchiseUsers < ActiveRecord::Migration
  def change
    create_table :franchise_users do |t|
      t.integer :user_id
      t.integer :franchise_id

      t.timestamps null: false
    end
  end
end
