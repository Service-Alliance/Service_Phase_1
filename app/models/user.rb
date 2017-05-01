class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :department
  has_many :jobs, foreign_key: :entered_by_id
  belongs_to :role
  has_many :job_managers, foreign_key: :job_manager_id
  has_many :franchise_users
  has_many :subscriptions
  has_many :notifications, foreign_key: :target_id



  def full_name
    first = first_name || " "
    last = last_name || " "
    return "#{first+ " " + last}"
  end

  def admin?
    self.role_id == 1 ? true : false
  end
  def job_coordinator?
    self.role_id == 2 ? true : false
  end
  def call_rep?
    self.role_id == 3 ? true : false
  end
  def project_manager?
    self.role_id == 4 ? true : false
  end
  def contractor?
    self.role_id == 5 ? true : false
  end
  def unassigned?
    self.role_id == 0 || self.role_id == nil  ? true : false
  end

end
