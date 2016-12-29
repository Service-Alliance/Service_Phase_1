class EmergencyContact < ActiveRecord::Base
  belongs_to :address

  def phones
    Phone.where(emergency_contact_id: self.id)
  end
end
