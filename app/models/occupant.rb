# == Schema Information
#
# Table name: occupants
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  address_id :integer
#  job_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Occupant < ActiveRecord::Base
  has_many :phones, as: :phoneable
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
