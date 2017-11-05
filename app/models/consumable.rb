class Consumable < ActiveRecord::Base
  validates :name, :purchase_unit, :cost_per_purchase_unit, :cost_per_unit, presence: true
end
