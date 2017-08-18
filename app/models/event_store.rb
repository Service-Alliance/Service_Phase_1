class EventStore < ActiveRecord::Base
  validates_presence_of :event_type, :data

  def self.sendgrid(data)
    create!(event_type: 'SGE', data: data)
  end

  def self.tsheets(data)
    create(event_type: 'TSH', data: data)
  end
end
