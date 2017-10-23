class CreateVendorLossRates < ActiveRecord::Migration
  def change
    create_table :vendor_loss_rates do |t|
      t.references :vendor, index: true, foreign_key: { on_delete: :cascade }
      t.references :loss_type, index: true, foreign_key: { on_delete: :cascade }
      t.decimal :rate

      t.timestamps null: false
    end
  end
end
