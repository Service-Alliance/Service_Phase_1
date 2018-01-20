class Tracker < ActiveRecord::Base
  belongs_to :trackable, polymorphic: true
  belongs_to :child_trackable, polymorphic: true
  belongs_to :tracker_task
  belongs_to :user

  # def link_to
  #   if self.tracker_task_id == 1
  #     job_path(job_id: self.trackable_id)
  #   elsif self.tracker_task_id == 2
  #     job_job_managers_path(self.trackable_id)
  #   elsif self.tracker_task_id == 3
  #     job_path(job_id: self.trackable_id)
  #   elsif self.tracker_task_id == 4
  #     job_path(job_id: self.trackable_id)
  #   end
  # end

  def next_step_task
    if self.tracker_task_id == 1
      return "Assign Manager"
    elsif self.tracker_task_id == 2
      return "Create Estimate"
    elsif self.tracker_task_id == 3
      return "Send Estimate"
    elsif self.tracker_task_id == 4
      return "Create Contract"
    elsif self.tracker_task_id == 5
      return "Send Contract"
    elsif self.tracker_task_id == 6
      return "Invoice Customer"
    end
  end
end
