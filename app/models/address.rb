require_relative '../../lib/zipcode'

class Address < ActiveRecord::Base
  belongs_to :state

  validates_format_of :zip_code, with: Servpro::Zipcode.regexp, message: "Zip should be 5 digits", if: -> { zip_code.present? }

  delegate :name, to: :state, allow_nil: true, prefix: true

  def full_address(separator = ' ')
    [address_1, address_2, city, state_name, zip_code, county].delete_if(&:blank?).join(separator)
  end

  def address_without_county(separator = ' ')
    [address_1, address_2, city, state_name, zip_code].delete_if(&:blank?).join(separator)
  end
end
