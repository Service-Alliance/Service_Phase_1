# == Schema Information
#
# Table name: oncalls
#
#  id           :integer          not null, primary key
#  scheduled_on :date
#  user_id      :integer
#  priority     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  state_id     :integer
#

require 'test_helper'

class OncallTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
