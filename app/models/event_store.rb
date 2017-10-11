require 'tusk/observable/pg'

class EventStore < ActiveRecord::Base
  validates_presence_of :event_type, :data

  TYPES = {
    SGE: 'sendgrid',
    TSH: 'tsheets'
  }

  extend Tusk::Observable::PG

  after_create :notify_observers


  def self.sendgrid(data)
    create(event_type: 'SGE', data: data)
  end

  def self.tsheets(data)
    create(event_type: 'TSH', data: data)
  end

  #This is used in message bus as a type of event
  def self.channel
    table_name
  end

  private

  def notify_observers
    self.class.changed
    self.class.notify_observers
  end
end
