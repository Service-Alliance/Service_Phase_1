class WorkOrderDraftDeliveryService < WorkOrderDeliveryService
  def deliver!
    send_to_scheduling_managers
  end
end
