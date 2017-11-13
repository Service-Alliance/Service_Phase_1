class WorkOrderDraftDeliveryService < WorkOrderDeliveryService
  def deliver!
    send_to_schedulers
  end
end
