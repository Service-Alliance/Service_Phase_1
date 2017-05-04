namespace :import do
    desc 'Import Sharpspring'
    task sharpspring: :environment do
      csv_text = File.read("#{Rails.root}/lib/assets/sharpspring.csv")
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        hash = row.to_hash
        owner_id = hash['owner_id']

        last_name = hash["last_name"]
        first_name = hash["first_name"]
        email = hash["email"]
        company_name = hash["company_name"]
        title = hash["title"]
        website = hash["website"]
        phone = hash["phone"]
        address_1 = hash["address_1"]
        address_2 = hash["address_2"]
        city = hash["city"]
        state_code = hash["state"]
        zip_code = hash["zip_code"]
        category = hash["category"]
        sub_category = hash["sub_category"]
        sharp_spring_id = hash["sharp_spring_id"]
        state = State.find_by(name: state_code)

        address = Address.create(address_1: address_1, address_2: address_2, city: city, state_id: state.try(:id), zip_code: zip_code)
        p customer = Customer.create(first_name: first_name, last_name: last_name, email: email, company_name: company_name, website: website, title: title, category: category, sub_category: sub_category, address_id: address.id, sharp_spring_id: sharp_spring_id)
        customer.phones.create(number: phone, type_id: 1)


      end

    end
end
