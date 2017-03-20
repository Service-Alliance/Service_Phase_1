json.extract! vendor_upload, :id, :vendor_id, :upload, :vendor_upload_type_id, :expiration_date, :name, :notes, :created_at, :updated_at
json.url vendor_upload_url(vendor_upload, format: :json)