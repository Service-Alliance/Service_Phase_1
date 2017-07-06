namespace :import do
    desc 'Import Logbook'
    task sales_fix: :environment do
      csv_text = File.read("#{Rails.root}/lib/assets/sales.csv")
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|

        hash = row.to_hash
        date = hash['Date Received']
        last_name = hash["last_name"]
        first_name = hash["first_name"]
        city = hash["City"]
        state = hash["State"]
        zip = hash["Zip"]
        phone = hash["Phone"]
        email = hash["E-Mail"]
        loss_type = hash["Loss Type"]
        insurance = hash["Insurance Company"]
        p referral_type = hash["Referral Type "]
        claim = hash["POLICY/CLAIM"]
        referral_note = hash["Referral Note"]
        adjuster_first_name = hash["adjuster_first_name"]
        adjuster_last_name = hash["adjuster_last_name"]
        pm_first_name = hash["pm_first_name"]
        pm_last_name = hash["pm_last_name"]
        sales_rep = hash["Sales Rep"]
        amount = hash["Amount"]
        franchise = hash["Franchise"]

        found_franchise = Franchise.find_by(name: franchise)

        found_loss_type = LossType.find_by(name: loss_type)

        formatted_date = Date.strptime(date, '%m/%d/%Y')
        user = User.find_by(first_name: pm_first_name, last_name: pm_last_name)
        adjuster = Adjuster.find_by(first_name: adjuster_first_name, last_name: adjuster_last_name)
        found_state = State.find_by(name: state)
        found_insurance = InsuranceCompany.find_by(name: insurance)
        p found_referral_type = ReferralType.find_by(name: referral_type)
        invoiced = JobStatus.find_by(name: "Invoiced")

        if first_name == nil
          first_name = ""
        end
        if last_name == nil
          last_name = ""
        end
        if email == nil
          email = ""
        end


      p  caller = Caller.find_by(first_name: first_name, last_name: last_name, email: email)

      p  job = caller.job

        if job && job.pricings.empty?
          p Pricing.create(price: amount, pricing_category_id: PricingCategory.last.id, job_id: job.id)
        end

      end

      end
end
