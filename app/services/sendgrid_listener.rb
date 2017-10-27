require_relative '../../lib/single_call_object'
require 'date'

class SendgridListener
  include Servpro::SingleCallObject

  def call(data)
    if data['origin_type'] && data['origin_type'].eql?('work_order') && data['origin_id']
      begin
        order = WorkOrder.find(data['origin_id'])
        order.events << event_builder(data)
        order.save
      rescue ActiveRecord::RecordNotFound => e
        Honeybadger.notify(e, context: data)
      end
    end
  end

  private

  def event_builder(data)
    "#{Time.at(data['timestamp']).to_datetime} | Email to #{data['email']} was #{data['event']} by IP #{data['ip']}"
  end
end
