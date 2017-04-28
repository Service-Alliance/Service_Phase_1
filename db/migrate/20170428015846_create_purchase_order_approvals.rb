class CreatePurchaseOrderApprovals < ActiveRecord::Migration
  def change
    create_table :purchase_order_approvals do |t|
      t.date :date
      t.text :job_name
      t.text :vendor
      t.text :purchase_item
      t.text :amount
      t.text :last_four_card
      t.integer :job_id

      t.timestamps null: false
    end
  end
end
