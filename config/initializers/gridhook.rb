Gridhook.configure do |config|
  config.event_receive_path = '/callback/sendgrid'
  config.event_class = 'EventStore'
  config.processor_method = :sendgrid
end
