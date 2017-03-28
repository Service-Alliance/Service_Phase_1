namespace :import do
    desc 'Import Franchise Zips'
    task franchise_zips: :environment do
      csv_text = File.read("#{Rails.root}/lib/assets/franchise_zips.csv")
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        hash = row.to_hash

        zip_code = hash["zip_code"]
        franchise_id = hash["franchise_id"]
        assigned = hash["assigned"]

        p FranchiseZipcode.create(franchise_id: franchise_id, assigned: assigned, zip_code: zip_code)

      end

    end
end
