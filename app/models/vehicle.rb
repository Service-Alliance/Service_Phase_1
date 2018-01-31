class Vehicle < ActiveRecord::Base
	validates :year, :name, :state, :brand, :license_plate, :mileage, :registration_date, :insurance_date, :inspection_date, presence: true

    scope :order_by_year, -> { order(year: :desc)}
end
