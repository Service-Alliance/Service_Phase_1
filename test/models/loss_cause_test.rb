require 'test_helper'

describe LossCause do
  it 'should not be valid without name' do
    LossCause.new(name:'').valid?.must_equal false
    LossCause.new(name:nil).valid?.must_equal false
  end
end
