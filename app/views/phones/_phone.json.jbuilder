json.extract! phone, :id, :number, :type_id, :occupant_id, :caller_id, :customer_id, :extension, :created_at, :updated_at
json.url phone_url(phone, format: :json)