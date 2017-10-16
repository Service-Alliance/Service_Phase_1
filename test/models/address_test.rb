require 'test_helper'

class AddressTest < ActiveSupport::TestCase

  test 'valid zipcode could be saved' do
    ['12345-6789', '12345 6789', '12345', nil].each do |valid_zip|
      address = Address.new(zip_code: valid_zip)
      assert address.valid?, "#{valid_zip} - should be valid"
    end
  end

  test "validation for zip_code field" do
    ['1234', '123456'].each do |incorrect_zip|
      address = Address.new(zip_code: incorrect_zip)

      refute address.valid?, "#{incorrect_zip} - should be not valid"
      assert_equal ['Zip should be 5 digits'], address.errors[:zip_code]
    end
  end

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

  test "full_address defaults to space for a separator" do
    address = Address.new(address_1: 'Line1', address_2: 'Line2', city: 'City')
    assert_equal('Line1 Line2 City', address.full_address)
  end

  test "full_address allows a custom separator" do
    address = Address.new(address_1: 'Line1', address_2: 'Line2')
    assert_equal('Line1, Line2', address.full_address(', '))
  end

  test "address_without_county returns all fields in the address except county" do
    address = Address.new(address_1: 'Line1', address_2: 'Line2', city: 'City', state: State.new(name: 'State'), zip_code: 'Zip', county: 'County')
    assert_equal('Line1 Line2 City State Zip', address.address_without_county)
  end

  test '#format_address returns the address formatted with breaks if asked' do
    address = Address.new(address_1: 'Line1', address_2: 'Line2', city: 'City', state: State.new(name: 'State'), zip_code: 'Zip')
    assert_equal('Line1<br />Line2<br />City<br />State<br />Zip', address.format_address(:breaks))
  end

  test '#format_address returns the address formatted with spaces if asked' do
    address = Address.new(address_1: 'Line1', address_2: 'Line2', city: 'City', state: State.new(name: 'State'), zip_code: 'Zip')
    assert_equal('Line1 Line2 City State Zip', address.format_address(:spaces))
  end

  test '#format_address returns the address formatted in condensed format if asked' do
    address = Address.new(address_1: 'Line1', address_2: 'Line2', city: 'City', state: State.new(name: 'State'), zip_code: 'Zip')
    assert_equal('Line1 Line2<br />City, State, Zip', address.format_address(:condensed))
  end
  test '#format_address return the address with oneline if asked' do
    address = Address.new(address_1: 'Line1', address_2: 'Line2', city: 'City', state: State.new(name: 'State'), zip_code: 'Zip')
    assert_equal('Line1 Line2 City, State, Zip', address.format_address(:oneline))
  end
end
