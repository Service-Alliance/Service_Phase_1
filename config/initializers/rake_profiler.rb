unless Rails.env.production?
  require 'rack-mini-profiler'
  require 'memory_profiler'

  # initialization is skipped so trigger it
  Rack::MiniProfilerRails.initialize!(Rails.application)
end
