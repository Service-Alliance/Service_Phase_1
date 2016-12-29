class Agent < ActiveRecord::Base
  belongs_to :address

  def phones
    Phone.where(agent_id: self.id)
  end
end
