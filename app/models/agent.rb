class Agent < ActiveRecord::Base
  belongs_to :address
  belongs_to :insurance_company
  has_many :phones, as: :phoneable
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def full_name
    first = first_name || " "
    last = last_name || " "
    return "#{first+ " " + last}"
  end
end
