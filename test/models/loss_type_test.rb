require 'test_helper'

describe LossType do
  it "by_name: should lookup existing name id" do
    LossType.id("Odor").must_equal 7
  end

  it "by_name: should throw an error if name is missing" do
    Proc.new{ LossType.id("Missing") }.must_raise KeyError
  end

  it 'should not be valid without name' do
    LossType.new(name:'').valid?.must_equal false
    LossType.new(name:nil).valid?.must_equal false
  end
end
