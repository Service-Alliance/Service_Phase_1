class CreateWorkOrderVendors < ActiveRecord::Migration
  def change
    create_table :work_order_vendors do |t|
      t.references :work_order, index: true, foreign_key: true
      t.references :vendor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
