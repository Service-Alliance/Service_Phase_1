class Scheduler < ActiveRecord::Base
  belongs_to :assigned_to_user, foreign_key: :assigned_to_user_id, class_name: 'User'
end
