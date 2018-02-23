class Contact < ActiveRecord::Base
  belongs_to :address
  has_many :phones, as: :phoneable
  belongs_to :user, foreign_key: :owner_id
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_blank: true
  validates_length_of :email, maximum: 60, allow_nil: true

end
