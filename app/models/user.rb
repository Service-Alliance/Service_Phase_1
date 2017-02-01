class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :department
  has_many :jobs, foreign_key: :entered_by_id
  belongs_to :role

  def full_name
    first = first_name || " "
    last = last_name || " "
    return "#{first+ " " + last}"
  end

  def admin?
    true if self.role_id = 1
  end
  def job_manager?
    true if self.role_id = 2
  end
  def call_rep?
    true if self.role_id = 3
  end
end
