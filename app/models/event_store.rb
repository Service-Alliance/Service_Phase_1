class EventStore < ActiveRecord::Base
  validates_presence_of :event_type, :data

  TYPES = {
    SGE: 'sendgrid',
    TSH: 'tsheets',
    SSP: 'sharpspring'
  }.freeze

  TYPES.each do |type, name|
    define_singleton_method name do |data|
      create(event_type: type, data: data)
    end
  end
end
