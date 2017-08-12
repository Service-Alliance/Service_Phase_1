# == Schema Information
#
# Table name: agents
#
#  id                   :integer          not null, primary key
#  first_name           :string
#  last_name            :string
#  email                :string
#  address_id           :integer
#  insurance_company_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Agent < ActiveRecord::Base
  belongs_to :address
  belongs_to :insurance_company
  has_many :phones, as: :phoneable

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def full_name
    first = first_name || " "
    last = last_name || " "
    return "#{first+ " " + last}"
  end
end
