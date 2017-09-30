class WorkOrderMailer < ApplicationMailer
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

end
