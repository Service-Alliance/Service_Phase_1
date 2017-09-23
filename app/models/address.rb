class Address < ActiveRecord::Base
  belongs_to :state

  delegate :name, to: :state, allow_nil: true, prefix: true

  def full_address(separator = ' ')
    [address_1, address_2, city, state_name, zip_code, county].delete_if(&:blank?).join(separator)
  end

  def address_without_county(separator = ' ')
    [address_1, address_2, city, state_name, zip_code].delete_if(&:blank?).join(separator)
  end
end
