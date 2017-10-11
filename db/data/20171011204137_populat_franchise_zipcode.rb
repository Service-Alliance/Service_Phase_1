class PopulatFranchiseZipcode < SeedMigration::Migration
  def up
    FranchiseZipcode.find_in_batches do |batch|
      batch.each { |mapping| mapping.update_attributes(assigned: false)}
    end

    csv_text = File.read("#{Rails.root}/db/files/PostalCodes.csv")
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      hash = row.to_hash
      zip_code = hash["zip_code"]
      franchise_id = hash["franchise_code"]

      FranchiseZipcode.create(franchise_id: franchise_id, zip_code: zip_code)
    end
  end

  def down
    FranchiseZipcode.where(assigned:true).delete_all

    FranchiseZipcode.where(assigned: false).find_in_batches do |batch|
      batch.each { |mapping| mapping.update_attributes(assigned: true)}
    end
  end
end
