json.extract! occupant, :id, :first_name, :last_name, :email, :address_id, :job_id, :created_at, :updated_at
json.url occupant_url(occupant, format: :json)