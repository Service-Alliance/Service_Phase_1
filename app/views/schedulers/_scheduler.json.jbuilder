json.extract! scheduler, :id, :event_date, :start_time, :end_time, :assigned_to_user_id, :job_id, :scheduler_event_type_id, :notes, :title, :created_at, :updated_at
json.url scheduler_url(scheduler, format: :json)