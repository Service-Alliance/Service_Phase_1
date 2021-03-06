class DailyUpdates < ApplicationMailer
  def all_pending
    @user = User.find_by(email: "aott@servpro5933.com")
    @jobs = Job.where(status_id: 1)
    mail(to: @user.email, subject: "Pending Jobs as of (#{Date.today})")
  end

  def assignment_managers_pending
    manager_role = Role.find_by(name: "Project Manager")
    @users = User.where(role_id: manager_role)
    @users.each do |user|
      @jobs = Job.where(status_id: 1, coordinator_id: user.id)
      unless @jobs.empty?
        mail(to: user.email, subject: "Pending Jobs as of (#{Date.today})")
      end
    end
  end

  def new_york_pending
    @jobs = Job.where(status_id: 1, franchise_id: [1, 3, 4, 6])
    mail(to: 'davidkluger1@gmail.com', subject: "Pending Jobs as of (#{Date.today})")
  end

  def new_jersey_pending
    @jobs = Job.where(status_id: 1, franchise_id: [2, 5])
    mail(to: 'meyerservpro@gmail.com', subject: "Pending Jobs as of (#{Date.today})")
  end
end
