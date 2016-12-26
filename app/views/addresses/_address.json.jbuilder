json.extract! address, :id, :address_1, :address_2, :zip_code, :city, :county, :address_type_id, :created_at, :updated_at
json.url address_url(address, format: :json)