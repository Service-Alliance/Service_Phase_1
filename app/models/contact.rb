class Contact < ActiveRecord::Base
  belongs_to :address
  has_many :phones, as: :phoneable
  belongs_to :user, foreign_key: :owner_id

  enum category: {customer: 0, agent: 1, adjuster: 2, caller: 3, occupant: 4, property_manager: 5}
end
