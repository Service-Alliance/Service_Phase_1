# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :text
#  address_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
  has_many :notes, as: :noteable, dependent: :destroy
  has_many :trackers, as: :trackable, dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :notes
  belongs_to :address

end
