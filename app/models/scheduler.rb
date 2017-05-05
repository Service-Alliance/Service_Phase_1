class Scheduler < ActiveRecord::Base
  belongs_to :assigned_to_user, foreign_key: :assigned_to_user_id, class_name: 'User'
  validates :event_date, presence: true

  def scheduler_event
    if self.scheduler_event_type_id == 1
      return "Call"
    elsif self.scheduler_event_type_id == 2
      return "Meeting"
    elsif self.scheduler_event_type_id == 3
      return "Task"
    elsif self.scheduler_event_type_id == 4
      return "Lunch"
    else
      return
    end
  end

  def check_manager(job)
    if job.job_managers.empty?
      job.job_managers.create(job_manager_id: self.assigned_to_user_id)
    end
  end
end
