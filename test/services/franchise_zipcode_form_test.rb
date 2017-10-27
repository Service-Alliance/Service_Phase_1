require 'test_helper'

module Geocoder::Result
  class Test
    def address_components
      [{ "long_name" => "12345", "short_name" => "12345", "types" => ["postal_code"] },
       { "long_name" => "Schenectady", "short_name" => "Schenectady", "types" => ["locality", "political"] },
       { "long_name" => "Rotterdam",
         "short_name" => "Rotterdam",
         "types" => ["administrative_area_level_3", "political"] },
       { "long_name" => "Schenectady County",
         "short_name" => "Schenectady County",
         "types" => ["administrative_area_level_2", "political"] },
       { "long_name" => "New York", "short_name" => "NY", "types" => ["administrative_area_level_1", "political"] },
       { "long_name" => "United States", "short_name" => "US", "types" => ["country", "political"] }]
    end
  end
end

class FranchiseZipcodeFormTest < ActiveSupport::TestCase
  test "should build an object" do
    object = FranchiseZipcodeForm.call({ franchise_id: '1', zip_code: '12345' })
    assert_equal 1, object.franchise_id
    assert_equal '12345', object.zip_code
    refute_nil object.county
  end
end
