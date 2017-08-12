# == Schema Information
#
# Table name: emergency_contacts
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  first_name :string
#  last_name  :string
#  email      :string
#  address_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EmergencyContact < ActiveRecord::Base
  belongs_to :address
  has_many :phones, as: :phoneable
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

end
