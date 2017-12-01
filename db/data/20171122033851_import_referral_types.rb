class ImportReferralTypes < SeedMigration::Migration
  def up
    csv = Rails.root.join('db', 'files', 'jobs-with-referral-type-id.csv')
    CSV.foreach(csv, headers: true) do |row|
      rowh = row.to_hash
      job = Job.find(rowh['id'])
      referral = job.referral || job.build_referral
      referral.referral_type_id = rowh['referral_type_id']
      referral.save!
      job.save!
    end
  end

  def down

  end
end
