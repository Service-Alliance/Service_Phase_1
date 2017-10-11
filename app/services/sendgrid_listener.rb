class SendgridListener
  def self.call(data)
    if data['origin_type'] && data['origin_type'].eql?('work_order') && data['origin_id']
      # do something with WorkOrder here
    end
  end
end
