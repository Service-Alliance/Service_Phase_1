class JobManager < ActiveRecord::Base
  belongs_to :job_manager, class_name: "User"
  delegate :full_name, to: :job_manager, allow_nil: true
  include PublicActivity::Model
end
