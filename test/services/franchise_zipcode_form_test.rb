require 'test_helper'
require 'geocoder/results/google'

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
  Geocoder::Lookup::Test.add_stub(
    "12345", [
    {'test'=>Geocoder::Result::Google.new(
    { "address_components" =>
        [{ "long_name" => "12345", "short_name" => "12345", "types" => ["postal_code"] },
         { "long_name" => "Schenectady", "short_name" => "Schenectady", "types" => ["locality", "political"] },
         { "long_name" => "Rotterdam",
           "short_name" => "Rotterdam",
           "types" => ["administrative_area_level_3", "political"] },
         { "long_name" => "Schenectady County",
           "short_name" => "Schenectady County",
           "types" => ["administrative_area_level_2", "political"] },
         { "long_name" => "New York", "short_name" => "NY", "types" => ["administrative_area_level_1", "political"] },
         { "long_name" => "United States", "short_name" => "US", "types" => ["country", "political"] }],
      "formatted_address" => "Schenectady, NY 12345, USA",
      "geometry" =>
        { "location" => { "lat" => 42.8140012, "lng" => -73.9814578 },
          "location_type" => "APPROXIMATE",
          "viewport" =>
            { "northeast" => { "lat" => 42.8153501802915, "lng" => -73.98010881970849 },
              "southwest" => { "lat" => 42.8126522197085, "lng" => -73.9828067802915 } } },
      "place_id" => "ChIJy_THIQZu3okR5Vhd3NrTQI8",
      "types" => ["postal_code"] }
  )}])

  test "should build an object" do
    object = FranchiseZipcodeForm.call({ franchise_id: '1', zip_code: '12345' })
    assert_equal 1, object.franchise_id
    assert_equal '12345', object.zip_code
    refute_nil object.county
  end
end
