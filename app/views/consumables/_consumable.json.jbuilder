json.extract! consumable, :id, :name, :purchase_unit, :cost_per_purchase_unit, :purchase_unit_quantity, :created_at, :updated_at
json.url consumable_url(consumable, format: :json)
