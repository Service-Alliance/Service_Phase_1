class EmergencyContact < ActiveRecord::Base
  belongs_to :address
  belongs_to :job
  has_many :phones, as: :phoneable
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

end
