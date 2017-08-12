# == Schema Information
#
# Table name: occupants
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  address_id :integer
#  job_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OccupantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
