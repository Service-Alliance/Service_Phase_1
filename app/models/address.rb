class Address < ActiveRecord::Base
  belongs_to :state

  delegate :name, to: :state, allow_nil: true, prefix: true

  def full_address
    [address_1, address_2, city, state_name, zip_code, county].delete_if(&:blank?).join(' ')
  end
end
