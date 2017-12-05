json.total @dt.count
json.rows do
  json.array! @dt.model do |job_manager|
    json.extract! job_manager, :id, :user_id, :first_name, :last_name, :job_id, :job_name, :schedule_date, :manager_confirmation
  end
end
