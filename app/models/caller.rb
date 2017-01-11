class Caller < ActiveRecord::Base
  belongs_to :job
  belongs_to :address
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def phones
    Phone.where(caller_id: self.id)
  end

end
