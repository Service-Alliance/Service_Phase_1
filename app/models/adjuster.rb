class Adjuster < ActiveRecord::Base
  belongs_to :address
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def phones
    Phone.where(adjuster_id: self.id)
  end

  def full_name
    first = first_name || " "
    last = last_name || " "
    return "#{first+ " " + last}"
  end
end
