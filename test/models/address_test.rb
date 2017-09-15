require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "full_address returns all fields in the address as a string" do
    address = Address.new(address_1: 'Line1', address_2: 'Line2', city: 'City', state: State.new(name: 'State'), zip_code: 'Zip', county: 'County')
    assert_equal('Line1 Line2 City State Zip County', address.full_address)
  end

  test "full_address omits null or empty string fields from the returned string" do
    address = Address.new(address_1: 'Line1', city: 'City', state: State.new(name: 'State'), zip_code: 'Zip')
    assert_equal('Line1 City State Zip', address.full_address)
  end

  test "full_address handles a null state" do
    address = Address.new(address_1: 'Line1', address_2: 'Line2', city: 'City', zip_code: 'Zip', county: 'County')
    assert_equal('Line1 Line2 City Zip County', address.full_address)
  end

  test "address_without_county returns all fields in the address except county" do
    address = Address.new(address_1: 'Line1', address_2: 'Line2', city: 'City', state: State.new(name: 'State'), zip_code: 'Zip', county: 'County')
    assert_equal('Line1 Line2 City State Zip', address.address_without_county)
  end
end
