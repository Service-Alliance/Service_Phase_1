json.extract! upload, :id, :upload, :file_name, :updated_at, :upload_category
json.url job_upload_url(@job, upload, format: :json)
