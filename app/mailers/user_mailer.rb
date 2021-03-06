class UserMailer < ApplicationMailer

  def manager_assignment(user, job_manager)
    @user = user
    @job_manager = job_manager

    mail(to: @user.email, subject: "#{@user.full_name}, you have been assigned to a new job.")
  end

  def mention_notification(user, job)
    @user = user
    @job = job

    mail(to: @user.email, subject: "#{@user.full_name}, you have been mentioned on #{@job.id}, #{@job.name}")
  end

  # Email collections users who are subscribed to a job
  def job_moved_to_invoiced(user, job)
    @user = user
    @job = job

    mail(to: @user.email, subject: "#{@user.full_name}, #{@job.name} has moved to invoiced.")
  end
  #Email collection users who have been added to a job
  def collections_user_added_to_job(user, job)
    @user = user
    @job = job

    mail(to: @user.email, subject: "#{@user.full_name}, you have been added as a subscriber to #{@job.name}.")
  end
end
