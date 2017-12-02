json.total @dt.count
json.rows do
  json.array! @dt.model do |user|
    json.extract! user, :id, :first_name, :last_name, :department_name
  end
end
