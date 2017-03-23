json.extract! tracker_task, :id, :name, :created_at, :updated_at
json.url tracker_task_url(tracker_task, format: :json)