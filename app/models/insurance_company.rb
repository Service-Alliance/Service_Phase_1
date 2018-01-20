class InsuranceCompany < ActiveRecord::Base
  include Trackable
  has_many :notes, as: :noteable, dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :notes
end
