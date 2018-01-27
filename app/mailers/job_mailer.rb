class JobMailer < ApplicationMailer
  def pricing_created(to, user, pricing, job)
    @user = user
    @pricing = pricing
    @job = job
    @mail = mail(to: to.email, subject: "Pricing created for job #{@job.name || @job.id}")
  end

  def files_uploaded(to, user, upload, job)
    @user = user
    @upload = upload
    @job = job
    @mail = mail(to: to.email, subject: "Files uploaded for job #{@job.name || @job.id}")
  end
end
