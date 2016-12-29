class Caller < ActiveRecord::Base
  belongs_to :job
  belongs_to :address

  def phones
    Phone.where(caller_id: self.id)
  end

end
