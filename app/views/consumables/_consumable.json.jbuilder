json.extract! consumable, :id, :name, :purchase_unit, :cost_per_purchase_unit, :cost_per_unit, :created_at, :updated_at
json.url consumable_url(consumable, format: :json)
