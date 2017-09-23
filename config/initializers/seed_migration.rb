SeedMigration.register User do
  exclude :created_at, :updated_at, :additional_title, :background_check, :bio_rec_bbp,
  :current_sign_in_at, :current_sign_in_ip, :fitness_test, :id, :sub_1, :sub_2, :sign_in_count
end
SeedMigration.register Role do
  exclude :created_at, :updated_at
end
SeedMigration.register Address do
  exclude :created_at, :updated_at, :address_type_id
end
SeedMigration.register Agent do
  exclude :created_at, :updated_at
end
SeedMigration.register Adjuster do
  exclude :created_at, :updated_at
end
SeedMigration.register Department do
  exclude :created_at, :updated_at
end
SeedMigration.register Location do
  exclude :created_at, :updated_at
end
SeedMigration.register Job do
  exclude :created_at, :updated_at, :adjuster_id, :agent_id, :contract_created_date, :contract_sent_date, :contract_sent, :coordinator_id, :fnol_received, :estimate_sent_date
end
SeedMigration.register Caller do
  exclude :created_at, :updated_at
end
SeedMigration.register Phone do
  exclude :created_at, :updated_at
end
SeedMigration.register Call do
  exclude :created_at, :updated_at, :answered, :callrail_id, :callsource, :customer_id, :datetime, :destinationnum, :duration, :first_call, :franchise_id
end
SeedMigration.register JobStatus do
  exclude :created_at, :updated_at
end
SeedMigration.register JobType do
  exclude :created_at, :updated_at
end
SeedMigration.register CorporateReferralType do
  exclude :created_at, :updated_at
end
SeedMigration.register Franchise do
  exclude :created_at, :updated_at
end
SeedMigration.register FranchiseZipcode do
  exclude :created_at, :updated_at
end
SeedMigration.register ReferralType do
  exclude :created_at, :updated_at
end
SeedMigration.register StructureType do
  exclude :created_at, :updated_at
end
SeedMigration.register PropertyType do
  exclude :created_at, :updated_at
end
SeedMigration.register AffectedType do
  exclude :created_at, :updated_at
end
SeedMigration.register FlooringType do
  exclude :created_at, :updated_at
end
SeedMigration.register LossType do
  exclude :created_at, :updated_at
end
SeedMigration.register LossCause do
  exclude :created_at, :updated_at
end
SeedMigration.register LossCauseType do
  exclude :created_at, :updated_at
end
SeedMigration.register State do
  exclude :created_at, :updated_at
end
SeedMigration.register InsuranceCompany do
  exclude :created_at, :updated_at
end
SeedMigration.register PhoneType do
  exclude :created_at, :updated_at
end
SeedMigration.register Form do
  exclude :created_at, :updated_at
end
SeedMigration.register Vendor do
  exclude :created_at, :updated_at
end
SeedMigration.register TrackerTask do
  exclude :created_at, :updated_at
end
SeedMigration.register VendorUploadType do
  exclude :created_at, :updated_at
end
SeedMigration.register AdminUser do
  exclude :created_at, :updated_at
end
SeedMigration.register PricingCategory do
  exclude :created_at, :updated_at
end
