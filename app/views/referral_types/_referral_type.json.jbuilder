json.extract! referral_type, :id, :name, :created_at, :updated_at, :associated_record_collection, :associated_record_type, :allows_notes, :sub_types
json.url referral_type_url(referral_type, format: :json)
