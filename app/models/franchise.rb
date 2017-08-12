# == Schema Information
#
# Table name: franchises
#
#  id                       :integer          not null, primary key
#  name                     :string
#  franchise_number         :integer
#  legal_name               :string
#  phone                    :string
#  fax                      :string
#  website                  :string
#  address_id               :integer
#  general_license          :string
#  residential_license      :string
#  commercial_license       :string
#  mold_remediation_license :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class Franchise < ActiveRecord::Base
  belongs_to :address
  has_many :notes, as: :noteable, dependent: :destroy
  has_many :trackers, as: :trackable, dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  has_many :jobs
  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :notes
end
