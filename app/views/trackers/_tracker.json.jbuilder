json.extract! tracker, :id, :trackable_id, :trackable_type, :created_at, :updated_at
json.url tracker_url(tracker, format: :json)