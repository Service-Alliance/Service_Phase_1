class LossType < ActiveRecord::Base
  has_many :loss_cause_types
  has_many :loss_causes, through: :loss_cause_types
  has_many :losses
  has_many :jobs, through: :losses

  validates_presence_of :name

  # FIXME: this should replace database lookup table eventually

  TYPES = { 1 => "Content Inventory",
            2 => "Fire",
            3 => "Fire/Water",
            4 => "General Cleaning",
            5 => "Liability",
            6 => "Mold",
            7 => "Odor",
            8 => "Sewage",
            9 => "Smoke",
            10 => "Vandalism",
            11 => "Water",
            12 => "Tree Removal",
            13 => "Equipment Rental",
            14 => "Asbestos",
            15 => "Biohazard",
            16 => "Duct Cleaning",
            17 => "Crime Scene",
            18 => "Power Washing",
            19 => "Construction",
            20 => "Board Up"}.freeze

  def self.fetch_all
    TYPES
  end

  def self.id(name)
    TYPES.invert.fetch(name)
  end
end
