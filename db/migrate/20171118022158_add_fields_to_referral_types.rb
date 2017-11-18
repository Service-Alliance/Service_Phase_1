class AddFieldsToReferralTypes < ActiveRecord::Migration
  def change
    add_column :referral_types, :parent_id, :integer, null: true, index: true
    add_foreign_key :referral_types, :referral_types, column: :parent_id, on_delete: :cascade

    add_column :referral_types, :associated_record_type, :string
    add_column :referral_types, :allows_notes, :boolean, null: false, default: false

    add_column :referral_types, :requires_subtype, :boolean, null: false, default: false
    add_column :referral_types, :requires_associated_record, :boolean, null: false, default: false
    add_column :referral_types, :requires_notes, :boolean, null: false, default: false
  end
end
