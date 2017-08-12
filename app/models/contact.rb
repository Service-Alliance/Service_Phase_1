# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  company    :string
#  first_name :string
#  last_name  :string
#  email      :string
#  owner_id   :integer
#  address_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ActiveRecord::Base
  belongs_to :address
  has_many :phones, as: :phoneable
  belongs_to :user, foreign_key: :owner_id


end
