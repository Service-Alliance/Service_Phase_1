class Adjuster < ActiveRecord::Base
  belongs_to :address

  def phones
    Phone.where(adjuster_id: self.id)
  end
end
