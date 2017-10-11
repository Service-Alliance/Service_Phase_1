require 'test_helper'

class EventStoreTest < ActiveSupport::TestCase
  DATA_FIELD = { "test" => "test" }.freeze

  test 'should be possible to create a record' do
    assert_equal true, EventStore.new(event_type: 'yeah', data: DATA_FIELD).valid?
  end

  test 'should save data field' do
    assert_equal DATA_FIELD, EventStore.new(event_type: 'yeah', data: DATA_FIELD).data
  end

  test '#tsheets' do
    assert_difference('EventStore.count') do
      EventStore.tsheets(DATA_FIELD)
    end
  end

  test "#sendgrid" do
    event = EventStore.sendgrid(test:'test')
    assert_equal true, event.persisted?
    assert_equal ({'test' =>'test'}), event.data
  end
end
