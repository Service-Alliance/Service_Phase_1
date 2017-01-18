json.extract! form, :id, :name, :package_id, :document_id, :signed, :link, :created_at, :updated_at
json.url form_url(form, format: :json)