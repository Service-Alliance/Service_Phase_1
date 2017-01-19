class Caller < ActiveRecord::Base
  belongs_to :job
  belongs_to :address
  has_many :phones, as: :phoneable
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }


end
