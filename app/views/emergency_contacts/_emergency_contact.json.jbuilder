json.extract! emergency_contact, :id, :job_id, :first_name, :last_name, :email, :address_id, :created_at, :updated_at
json.url emergency_contact_url(emergency_contact, format: :json)