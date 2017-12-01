class JobManager < ActiveRecord::Base
  belongs_to :job_manager, class_name: "User"
  belongs_to :job

  include PublicActivity::Model

  delegate :full_name, :phone_numbers, to: :job_manager, allow_nil: true
end
