class JobManager < ActiveRecord::Base
  belongs_to :job_manager, class_name: "User"
end
