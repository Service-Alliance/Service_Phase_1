class Contact < ActiveRecord::Base
  belongs_to :address
  has_many :phones, as: :phoneable
  belongs_to :user, foreign_key: :owner_id


end
