class FranchiseZipcode < ActiveRecord::Base
  belongs_to :franchise

  def self.build(params)
    new(params)

    if (search = Geocoder.search(self.zip_code).first)
      if search.address_components && search.address_components.third && search.address_components.third['long_name']
        self.city = search.city
        self.county = search.address_components.third['long_name']
        self.save
      end
    end

    return self
  end
end
