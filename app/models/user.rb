class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :department
  has_many :jobs, foreign_key: :entered_by_id
  belongs_to :role
  has_many :job_managers, foreign_key: :job_manager_id
  has_many :franchise_users
  has_many :subscriptions
  has_many :notifications, foreign_key: :target_id
  has_many :trackers



  def full_name
    first = first_name || " "
    last = last_name || " "
    return "#{first+ " " + last}"
  end

  def admin?
    self.role_id == 1 ? true : false
  end
  def owner?
    self.try(:role).try(:name) == 'Owner' ? true : false
  end
  def job_coordinator?
    self.role_id == 2 ? true : false
  end
  def call_rep?
    self.role_id == 3 ? true : false
  end
  def project_manager?
    self.role_id == 4 ? true : false
  end
  def contractor?
    self.role_id == 5 ? true : false
  end
  def technician?
    self.try(:role).try(:name) == 'Technician' ? true : false
  end
  def crew_chief?
    self.try(:role).try(:name) == 'Crew Chief' ? true : false
  end
  def unassigned?
    self.role_id == 0 || self.role_id == nil  ? true : false
  end

  def metrics(days)
    note = TrackerTask.find_by(name: "Note Created")
    pricing = TrackerTask.find_by(name: "Pricing Created")
    work_order = TrackerTask.find_by(name: "Work Order Created")
    array = []
    array << self.full_name
    array << self.jobs.where("created_at > ?", Time.now-days.days).count
    array << self.trackers.where(tracker_task_id: note.id).where("created_at > ?", Time.now-days.days).count
    array << self.trackers.where(tracker_task_id: pricing.id).where("created_at > ?", Time.now-days.days).count
    array << self.trackers.where(tracker_task_id: work_order.id).where("created_at > ?", Time.now-days.days).count
    return array
  end

  def self.user_metrics(days)
    metrics = ['Jobs', 'Notes', 'Pricings Created', 'Work Orders']
    # note = TrackerTask.find_by(name: "Note Created")
    estimate = TrackerTask.find_by(name: "Pricing Created")
    work_order = TrackerTask.find_by(name: "Work Order Created")

    array = []
    metrics.each do |metric|
      users = {}
      User.all.each do |user|
        if user.jobs.count > 0
          if metric == 'Jobs'
            users[user.full_name] = user.jobs.where("created_at > ?", Time.now-days.days).count
          elsif metric == 'Notes'
            users[user.full_name] = Note.where(user_id: user.id, noteable_type: "Job").where("created_at > ?", Time.now-days.days).count
          elsif metric == 'Estimates'
            users[user.full_name] = user.trackers.where(tracker_task_id: estimate.id).where("created_at > ?", Time.now-days.days).count
          elsif metric == 'Work Orders'
            users[user.full_name] = user.trackers.where(tracker_task_id: work_order.id).where("created_at > ?", Time.now-days.days).count
          end
        end
      end
      thing = {
        name: metric,
        data: users
      }
      array << thing
    end
    return array

  end

end
