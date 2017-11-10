class WorkOrderPublishDeliveryService < WorkOrderDeliveryService
  def deliver!
    send_to_current_user
    send_to_loss_coordinator
    send_to_job_managers
    send_to_vendor
    send_to_crew
    send_to_franchise_distribution
  end
end
