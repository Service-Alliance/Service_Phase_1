json.extract! notification, :id, :notify_type, :actor_id, :target_id, :event_id, :job_id, :notify_text, :created_at, :updated_at
json.url notification_url(notification, format: :json)