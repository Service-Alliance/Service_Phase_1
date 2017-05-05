class AddFieldsToPurchaseOrderApproval < ActiveRecord::Migration
  def change
    add_column :purchase_order_approvals, :description, :text
    add_column :purchase_order_approvals, :user_id, :integer
  end
end
