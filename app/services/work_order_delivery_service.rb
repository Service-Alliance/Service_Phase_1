class WorkOrderDeliveryService
  def initialize(work_order, current_user)
    @work_order = work_order
    @current_user = current_user
  end

  def deliver!
    send_to_current_user
    send_to_scheduling_manager
    send_to_loss_coordinator
    send_to_job_managers
    send_to_vendors
    send_to_crew
  end

  private

  def send_to_current_user
    deliver_user_email(@current_user)
  end

  def send_to_scheduling_manager
    return unless should_send_to_scheduling_manager?
    sched_manager = User.find_by(email: "kroggemann@servpro5933.com")
    deliver_user_email(sched_manager) if sched_manager.present?
  end

  def should_send_to_scheduling_manager?
    !(@current_user.department_name == 'Construction' && @work_order.vendors.count > 0)
  end

  def send_to_loss_coordinator
    job_coordinator = @work_order.job.job_coordinator
    deliver_user_email(job_coordinator) if job_coordinator.present?
  end

  def send_to_job_managers
    @work_order.job.job_managers.each do |manager|
      if manager.job_manager && manager.job_manager.email != nil
        deliver_vendor_email(manager.job_manager)
      end
    end
  end

  def send_to_vendors
    @work_order.vendors.each do |vendor|
      vendor.customers.each do |contact|
        deliver_vendor_email(contact, vendor) if contact.email.present?
      end
    end
  end

  def send_to_crew
    @work_order.users.each do |crew|
      deliver_user_email(crew)
    end
  end

  def deliver_user_email(user)
    WorkOrderMailer.notification(user, @work_order.job, @work_order).deliver_later
  end

  def deliver_vendor_email(contact, vendor = nil)
    WorkOrderMailer.vendor_notification(contact, @work_order.job, @work_order, vendor).deliver_later
  end
end
