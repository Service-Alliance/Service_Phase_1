class Pricing < ActiveRecord::Base
  belongs_to :job_status, foreign_key: :current_status_id, class_name: 'JobStatus'
end
