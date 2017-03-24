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


        if wc == "NONE ON FILE" || wc == "N/A" || wc =="AFFADAVIT ON FILE" || wc == "AFFIDAVIT" || wc == "WILL UPDATE UPON NEW JOB"
          formatted_wc = ""
        else
          p wc
          p formatted_wc = Date.strptime(wc, '%m/%d/%y')
        end
        if liability == "NONE ON FILE"|| liability == "N/A" || liability == "AFFADAVIT ON FILE" || liability == "AFFIDAVIT" || liability == "WILL UPDATE UPON NEW JOB"
          formatted_liability = ""
        else
          p liability
          p formatted_liability = Date.strptime(liability, '%m/%d/%y')
        end
        if pollution == "NONE ON FILE"|| pollution ==  "N/A" || pollution == "AFFADAVIT ON FILE" || pollution == "AFFIDAVIT" || pollution == "WILL UPDATE UPON NEW JOB"
          formatted_pollution = ""
        else
          formatted_pollution = Date.strptime(pollution, '%m/%d/%y')
        end
        if auto == "NONE ON FILE"|| auto == "N/A" || auto == "AFFADAVIT ON FILE" || auto == "AFFIDAVIT" || auto == "WILL UPDATE UPON NEW JOB" || auto == "WILL OBTAIN UPON NEW JOB"
          formatted_auto = ""
        else
          formatted_auto = Date.strptime(auto, '%m/%d/%y')
        end

        Vendor.create(category_type: category_type, name: name, phone: phone, cellphone: cellphone, fax: fax,  address: address, wc: formatted_wc, liability: formatted_liability, pollution: formatted_pollution, auto: formatted_auto, w9: w9, independent_contractor_agreement: independent_contractor_agreement, email: email, active: true)

      end

    end
end
