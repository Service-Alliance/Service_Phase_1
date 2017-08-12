# == Schema Information
#
# Table name: emergency_contacts
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  first_name :string
#  last_name  :string
#  email      :string
#  address_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EmergencyContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
