class UserMailer < ApplicationMailer

  def manager_assignment(user, job_manager)
    @user = user
    @job_manager = job_manager

    mail(to: @user.email, subject: "#{@user.full_name}, you have been assigned to a new job.")
  end

  def work_order_notification(user, job, work_order)
    @user = user
    @job = job
    @work_order = work_order

    mail(to: @user.email, subject: "#{@user.full_name}, you have been sent a work order for job #{@job.id}.")
  end

end
