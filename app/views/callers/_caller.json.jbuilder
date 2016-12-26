json.extract! caller, :id, :first_name, :last_name, :email, :address_id, :job_id, :created_at, :updated_at
json.url caller_url(caller, format: :json)