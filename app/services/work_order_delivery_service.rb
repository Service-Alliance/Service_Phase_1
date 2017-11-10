class WorkOrderDeliveryService
  SCHEDULING_MANAGERS = %w(dankluger@servpro5933.com edwinl411@aol.com zpisoni@servpro5933.com).freeze

  def initialize(work_order, current_user)
    @work_order = work_order
    @current_user = current_user
  end

  def deliver!
  end

  private

  def send_to_current_user
    deliver_user_email(@current_user)
  end

  def send_to_scheduling_managers
    return unless should_send_to_scheduling_manager?
    SCHEDULING_MANAGERS.each do |manager|
      send_to_scheduling_manager(manager)
    end
  end

  def send_to_scheduling_manager(email)
    user = User.find_by(email: email)
    deliver_draft_email(user) if user.present?
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

  def send_to_franchise_distribution
    return if @work_order.franchise.nil?
    @work_order.franchise.work_order_distribution.each do |user|
      deliver_user_email(user)
    end
  end

  def deliver_user_email(user)
    WorkOrderMailer.notification(user, @work_order.job, @work_order).deliver_later
  end

  def deliver_draft_email(user)
    WorkOrderMailer.draft(user, @work_order.job, @work_order).deliver_later
  end

  def deliver_vendor_email(contact, vendor = nil)
    WorkOrderMailer.vendor_notification(contact, @work_order.job, @work_order, vendor).deliver_later
  end
end
