require 'test_helper'

class LossTypeTest < ActiveSupport::TestCase
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
            14 => "Construction",
            15 => ""}.invert.freeze



  test "by_name: should lookup existing name id" do
    assert_equal(7,LossType.by_name("Odor"))
  end

  test "by_name: should throw an error if name is missing" do
    assert_raises(KeyError) { LossType.by_name("Missing") }
  end

  test "by_name:"
end
