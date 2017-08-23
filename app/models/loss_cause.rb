class LossCause < ActiveRecord::Base
  has_many :loss_types

  validates_presence_of :name

  # Lookup table should be removed in favor of this cached hash
  # This is just a table duplicate

  CAUSES = {
    1 => 'Fire',
    2 => 'Other',
    3 => 'Sewage',
    4 => 'Smoke',
    5 => 'Water',
    6 => 'Candle',
    7 => 'Dishwasher',
    8 => 'Electrical Malfunction',
    9 => 'Grease',
    10 => 'Lightning',
    11 => 'Other Appliance',
    12 => 'Puffback-Furnace',
    13 => 'Refrigerator',
    14 => 'Stove/Oven',
    15 => 'Unknown',
    16 => 'Washing Machine',
    17 => 'AC Leak',
    18 => 'Hot Water Heater',
    19 => 'Flood',
    20 => 'Hurricane',
    21 => 'Ice Storm',
    22 => 'Other Weather',
    23 => 'Pipe',
    24 => 'Roof Leak',
    25 => 'Slab Leak',
    26 => 'Sump Pump Failure',
    27 => 'Toilet',
    28 => 'Tornado',
    29 => 'Wind',
    30 => 'Animal',
    31 => 'Mildew',
    32 => 'Sewage Back-Up',
    33 => 'Stain on Carpet',
    36 => 'Rain',
    37 => "Post Construction"
  }.freeze
end
