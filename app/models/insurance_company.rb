# == Schema Information
#
# Table name: insurance_companies
#
#  id                        :integer          not null, primary key
#  name                      :string
#  bulletin_number           :string
#  effective_date            :date
#  states_involved           :text
#  property_type             :string
#  collect_deductible        :text
#  esl                       :integer
#  estimating_software       :text
#  pricing                   :text
#  customer_service_contacts :text
#  special_conditions        :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class InsuranceCompany < ActiveRecord::Base
  has_many :notes, as: :noteable, dependent: :destroy
  has_many :trackers, as: :trackable, dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :notes
end
