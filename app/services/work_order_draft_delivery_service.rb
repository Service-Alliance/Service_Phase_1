class WorkOrderDraftDeliveryService < WorkOrderDeliveryService
  def deliver!
    send_to_schedulers
    send_to_scheduling_manager
  end
end
