class FranchiseZipcode < ActiveRecord::Base
  after_create :city_county_geocode

  def city_county_geocode
    if search = Geocoder.search(self.zip_code).first
      if search.address_components && search.address_components.third && search.address_components.third['long_name']
        self.city = search.city
        self.county = search.address_components.third['long_name']
        self.save
      end
    end
  end

end
