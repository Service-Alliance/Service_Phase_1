class CustomerMailer < ApplicationMailer

  def welcome_email(caller)
    @caller = caller

    mail(to: @caller.email, subject: "Welcome!")
  end
end
