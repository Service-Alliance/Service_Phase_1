class AddReferralVendorIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :referral_vendor_id, :integer
  end
end
