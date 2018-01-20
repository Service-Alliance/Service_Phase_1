module Trackable
  extend ActiveSupport::Concern

  included do
    has_many :trackers, as: :trackable, dependent: :destroy
  end

  def track(task_name, user, child = nil, note = '')
    task = TrackerTask.find_by name: task_name
    throw "Tracker Task '#{task_name}' does not exist" if task.nil?
    self.trackers.create!(tracker_task: task, child_trackable: child, user: user, note: note)
  end
end
