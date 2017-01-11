class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :department

  def full_name
    first = first_name || " "
    last = last_name || " "
    return "#{first+ " " + last}"
  end
end
