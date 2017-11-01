class WorkOrderDraftDeliveryService
  def initialize(work_order, current_user)
    @work_order = work_order
    @current_user = current_user
  end

  def deliver!
    send_to_current_user
    send_to_scheduling_manager1
    send_to_scheduling_manager2
    send_to_scheduling_manager3
    send_to_loss_coordinator
  end

  private

  def send_to_current_user
    deliver_user_email(@current_user)
  end

  def send_to_scheduling_manager1
    return unless should_send_to_scheduling_manager?
    sched_manager = User.find_by(email: 'dankluger@servpro5933.com')
    deliver_user_email(sched_manager) if sched_manager.present?
  end

  def send_to_scheduling_manager2
    return unless should_send_to_scheduling_manager
    sched_manager = User.find_by(email: 'edwinl411@aol.com')
    deliver_user_email(sched_manager) if sched_manager.present?
  end

  def send_to_scheduling_manager3
    return unless should_send_to_scheduling_manager?
    sched_manager = User.find_by(email: 'zpisoni@servpro5933.com')
    deliver_user_email(sched_manager) if sched_manager.present?
  end

  def send_to_loss_coordinator
    job_coordinator = @work_order.job.job_coordinator
    deliver_user_email(job_coordinator) if job_coordinator.present?
  end

  def should_send_to_scheduling_manager?
    !(@current_user.department_name == 'Construction' && @work_order.vendors.count > 0)
  end

  def deliver_user_email(user)
    WorkOrderMailer.notification(user, @work_order.job, @work_order).deliver_later
  end
