json.extract! job_status, :id, :name, :created_at, :updated_at
json.url job_status_url(job_status, format: :json)