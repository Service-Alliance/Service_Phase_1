json.extract! phone, :id, :number, :type, :extension, :created_at, :updated_at
json.url phone_url(phone, format: :json)