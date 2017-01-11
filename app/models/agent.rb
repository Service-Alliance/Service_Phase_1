class Agent < ActiveRecord::Base
  belongs_to :address
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def phones
    Phone.where(agent_id: self.id)
  end
end
