json.array! @calls do |call|
  json.extract! call, :id, :callrail_id, :recording, :datetime, :customer_phone_number, :customer_name, :job_id, :customer_id, :utm_campaign, :duration
  json.url call_url(call, format: :json)
end
