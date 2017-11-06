class Consumable < ActiveRecord::Base
  validates :name, :purchase_unit, :cost_per_purchase_unit, :cost_per_unit, presence: true

  scope :name_ordered, -> { order(:name) }
end
