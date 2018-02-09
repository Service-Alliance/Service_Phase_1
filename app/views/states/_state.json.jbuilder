json.extract! state, :id, :name, ,:tax_rate, :city_name, :county_name, :county_rate :city_rate, :special_rate, :local_tax_total, :created_at, :updated_at
json.url state_url(state, format: :json)