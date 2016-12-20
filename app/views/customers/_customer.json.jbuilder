json.extract! customer, :id, :address_1, :address_2, :zip, :city, :state_id, :county, :created_at, :updated_at
json.url customer_url(customer, format: :json)