class Vehicle < ActiveRecord::Base
  include Trackable

  validates :year, :name, :state, :brand, :license_plate, :mileage, :registration_date, :insurance_date, :inspection_date, presence: true
  has_many :notes, as: :noteable, dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :notes


  scope :order_by_year, -> { order(year: :desc)}
end
