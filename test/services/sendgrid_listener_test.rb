require 'test_helper'

class SendgridListenerTest < ActiveSupport::TestCase
  setup { @event = event_stores(:sendgrid) }

  test '#call should update events for WorkOrder' do
    attribs = work_orders(:one).attributes.merge('id' => @event.data['origin_id'])
    attribs.delete('crew')
    order = WorkOrder.create!(attribs)

    assert_difference "WorkOrder.find(#{@event.data['origin_id']}).events.count" do
      SendgridListener.call(@event.data)

      assert WorkOrder.find(@event.data['origin_id']).events.last.end_with?("| Email to aott@servpro5933.com was open by IP 47.19.76.18")
    end

    order.delete
  end

  test 'if WorkOrder is missing doesnt throw error' do
    refute SendgridListener.call(@event.data)
  end
end
