class MigrateHasManyVendorAssociationToBelongsTo < ActiveRecord::Migration
  def up
    WorkOrderVendor.pluck(:work_order_id).uniq.each do |work_order_id|
      wo = WorkOrder.find(work_order_id)
      wo.update_attributes vendor_id: WorkOrderVendor.find_by(work_order_id: work_order_id).id
    end
    drop_table :work_order_vendors
  end

  def down
    create_table :work_order_vendors do |t|
      t.references :work_order, index: true, foreign_key: true
      t.references :vendor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
