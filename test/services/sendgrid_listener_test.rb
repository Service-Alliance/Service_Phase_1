require 'test_helper'

class SendgridListenerTest < ActiveSupport::TestCase
  setup { @event = event_stores(:sendgrid) }

  test '#call should update events for WorkOrder' do
    order = WorkOrder.create!(work_orders(:one).attributes.merge(id:@event.data['origin_id']))

    assert_difference "WorkOrder.find(#{@event.data['origin_id']}).events.count" do
      SendgridListener.call(@event.data)

      assert_equal "Wed, 10/11/17  3:08 AM | Email to aott@servpro5933.com was open by IP 47.19.76.18", WorkOrder.find(@event.data['origin_id']).events.last
    end

    order.delete
  end

  test 'if WorkOrder is missing doesnt throw error' do
    refute SendgridListener.call(@event.data)
  end
end
