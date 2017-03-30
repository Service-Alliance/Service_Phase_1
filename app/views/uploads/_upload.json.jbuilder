json.extract! upload, :id, :upload, :updated_at
json.url job_upload_url(@job, upload, format: :json)
