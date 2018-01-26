class CreateFranchiseSchedulingManagers < ActiveRecord::Migration
  def change
    create_table :franchise_scheduling_managers do |t|
      t.references :user, index: true, foreign_key: {on_delete: :cascade}
      t.references :franchise, index: true, foreign_key: {on_delete: :cascade}

      t.timestamps null: false
    end
  end
end
