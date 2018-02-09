json.extract! state, :id, :name, ,:tax_rate, :created_at, :updated_at
json.url state_url(state, format: :json)