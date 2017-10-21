class CreateFranchiseWorkOrderDistributions < ActiveRecord::Migration
  def change
    create_table :franchise_work_order_distributions do |t|
      t.references :franchise, index: true, foreign_key: {on_delete: :cascade}
      t.references :user, index: true, foreign_key: {on_delete: :cascade}

      t.timestamps null: false
    end
  end
end
