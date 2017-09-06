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
    subject = "#{@user.full_name}, you have been sent a work order for job #{@job.id}, #{@job.name}. Franchise: #{@job.franchise.try(:name)}."
    @to = @work_order.to.join(', ')

    @mail = mail(to: @user.email, subject: subject)

    MailLog.create(
      name: @user.full_name,
      email: @user.email,
      subject: subject,
      body: @mail.body.encoded,
      mail_loggable: work_order
    )
  end

  def mention_notification(user, job)
    @user = user
    @job = job

    mail(to: @user.email, subject: "#{@user.full_name}, you have been mentioned on #{@job.id}, #{@job.name}")
  end

  def vendor_work_order_notification(customer, job, work_order, vendor = nil)
    @customer = customer
    @job = job
    @work_order = work_order
    subject = "#{@customer.full_name}, you have been sent a work order from Service Alliance for job,#{@job.name}. Franchise: #{@job.franchise.try(:name)}."
    @to = vendor.nil? ? @work_order.to.join(', ') : vendor.name

    @mail = mail(to: @customer.email, subject: subject)

    MailLog.create(
      name: @customer.full_name,
      email: @customer.email,
      subject: subject,
      body: @mail.body.encoded,
      mail_loggable: work_order
    )
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
