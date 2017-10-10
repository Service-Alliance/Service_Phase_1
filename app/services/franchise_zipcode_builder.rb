require_relative '../../lib/service_object'

class FranchiseZipcodeBuilder
  include Servpro::ServiceObject

  def call(params)
    object = FranchiseZipcode.new(params)

    if (search = Geocoder.search(object.zip_code).first)
      if search.address_components && search.address_components.third && search.address_components.third['long_name']
        object.city = search.city
        object.county = search.address_components.third['long_name']
        object.save
      end
    end

    return object
  end
end
