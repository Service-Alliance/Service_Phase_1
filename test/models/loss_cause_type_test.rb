# == Schema Information
#
# Table name: loss_cause_types
#
#  id            :integer          not null, primary key
#  loss_type_id  :integer
#  loss_cause_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class LossCauseTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
