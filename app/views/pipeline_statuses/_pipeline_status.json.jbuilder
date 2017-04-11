json.extract! pipeline_status, :id, :name, :created_at, :updated_at
json.url pipeline_status_url(pipeline_status, format: :json)