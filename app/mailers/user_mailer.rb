class UserMailer < ApplicationMailer

  def manager_assignment(user, job)
    @user = user
    @job = job

    mail(to: @user.email, subject: "#{@user.full_name}, you have been assigned to a new job.")
  end

end
