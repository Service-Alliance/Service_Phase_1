class EmergencyContact < ActiveRecord::Base
  belongs_to :address
  belongs_to :job
  has_many :phones, as: :phoneable
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
