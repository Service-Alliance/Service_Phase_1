json.extract! contact, :id, :first_name, :last_name, :email, :owner_id, :address_id, :created_at, :updated_at,  :user
json.url contact_url(contact, format: :json)
