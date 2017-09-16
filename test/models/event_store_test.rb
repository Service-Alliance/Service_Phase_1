require 'test_helper'

class EventStoreTest < ActiveSupport::TestCase
  test "#sendgrid" do
    event = EventStore.sendgrid(test:'test')
    assert_equal true, event.persisted?
    assert_equal ({'test' =>'test'}), event.data
  end
end
