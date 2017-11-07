class Consumable < ActiveRecord::Base
  validates :name, :purchase_unit, :cost_per_purchase_unit, :purchase_unit_quantity, presence: true

  scope :name_ordered, -> { order(:name) }
end
