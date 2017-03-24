namespace :import do
    desc 'Import Vendors'
    task active_vendors: :environment do
      csv_text = File.read("#{Rails.root}/lib/assets/active_vendors.csv")
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        p hash = row.to_hash
        name = hash["Vendor_Name"]
        next if name == nil
        category_type = hash["Category"]

        phone = hash["Phone_Number"]
        cellphone = hash["Cell_Phone"]
        fax = hash["Fax_Number"]
        address = hash["Address"]
        wc = hash["Workers_Compensation"]
        liability = hash["Liability_Insurance"]
        pollution = hash["Pollution"]
        auto = hash["Auto_Insurance"]
        w9 = hash["W-9"]
        independent_contractor_agreement = hash["Indepndent_Agreement"]
        email = hash["Email_Address"]


        if wc == "NONE ON FILE" || "N/A"
          formatted_wc = ""
        else
          formatted_wc = Date.strptime(wc, '%m/%d/%Y')
        end
        if liability == "NONE ON FILE"|| "N/A"
          formatted_liability = ""
        else
          formatted_liability = Date.strptime(liability, '%m/%d/%Y')
        end
        if pollution == "NONE ON FILE"|| "N/A"
          formatted_pollution = ""
        else
          formatted_pollution = Date.strptime(pollution, '%m/%d/%Y')
        end
        if auto == "NONE ON FILE"|| "N/A"
          formatted_auto = ""
        else
          formatted_auto = Date.strptime(auto, '%m/%d/%Y')
        end

        Vendor.create(category_type: category_type, name: name, phone: phone, cellphone: cellphone, fax: fax,  address: address, wc: formatted_wc, liability: formatted_liability, pollution: formatted_pollution, auto: formatted_auto, w9: w9, independent_contractor_agreement: independent_contractor_agreement, email: email, active: true)

      end

    end
end
