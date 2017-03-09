class CreateCorporateReferralTypes < ActiveRecord::Migration
  def change
    create_table :corporate_referral_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
