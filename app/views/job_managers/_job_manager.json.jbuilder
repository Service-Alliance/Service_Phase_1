json.extract! job_manager, :id, :job_manager_id, :schedule_datetime, :note, :created_at, :updated_at
json.url job_manager_url(job_manager, format: :json)