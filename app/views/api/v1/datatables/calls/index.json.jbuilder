json.total @dt.count
json.rows do
  json.array! @dt.model do |call|
    json.extract! call, :id, :callrail_id, :datetime, :customer_phone_number, :customer_name, :customer_city, :utm_campaign, :duration, :job_id
  end
end
