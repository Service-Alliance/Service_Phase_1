class Job < ActiveRecord::Base
  belongs_to :job_status, foreign_key: :status_id, class_name: "JobStatus"
  belongs_to :job_type, foreign_key: :type_id, class_name: "JobType"
  belongs_to :franchise
  belongs_to :referral_type
  belongs_to :customer

end
