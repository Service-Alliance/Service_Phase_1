Gridhook.configure do |config|
  config.event_receive_path = '/callback/sendgrid'

  config.event_processor = proc do |event|
    EventStore.sendgrid(event.attributes)
    SendgridListener.delay.call(event.attributes)
  end
end
