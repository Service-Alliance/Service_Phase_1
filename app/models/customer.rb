class Customer < ActiveRecord::Base
  has_many :phones, as: :phoneable
  belongs_to :address
  # validates :email, presence: true, format: {
  # with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
  # message: 'Invalid email format.'
  # }
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  def full_name
    first = first_name || " "
    last = last_name || " "
    return "#{first+ " " + last}"
  end


end
