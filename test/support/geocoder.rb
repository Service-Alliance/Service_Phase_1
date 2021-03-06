Geocoder.configure(:lookup => :test)

Geocoder::Lookup::Test.set_default_stub(
  [
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
      "types" => ["postal_code"]
    }
  ]
)

