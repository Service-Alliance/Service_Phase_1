json.extract! upload, :id, :upload, :file_name, :updated_at
json.url job_upload_url(@job, upload, format: :json)
