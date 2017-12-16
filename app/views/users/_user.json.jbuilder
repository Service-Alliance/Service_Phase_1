json.extract! user, :id, :email, :first_name, :last_name, :name, :created_at, :updated_at
json.url user_url(user, format: :json)
json.department user.department
