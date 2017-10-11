require 'test_helper'

class SendgridListenerTest < ActiveSupport::TestCase
  test '#call should update events for WorkOrder' do
    event = event_stores(:sendgrid)
    order = WorkOrder.create!(work_orders(:one).attributes.merge(id:event.data['origin_id']))

    assert_difference "WorkOrder.find(#{event.data['origin_id']}).events.count" do
      SendgridListener.call(event.data)
    end

    order.delete
  end


  test 'if WorkOrder is missing' do
    event = event_stores(:sendgrid)

    assert_difference 'Honeybadger::Backend::Test.notifications.count', 0 do
      SendgridListener.call(event.data)
    end
  end
end
