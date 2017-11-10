class WorkOrderDraftDeliveryService < WorkOrderDeliveryService
  def deliver!
    send_to_current_user
    send_to_scheduling_managers
    send_to_loss_coordinator
    send_to_job_managers
    send_to_franchise_distribution
    send_to_vendors
  end
end
