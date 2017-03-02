class AddReferralNotesToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :referral_note, :text
  end
end
