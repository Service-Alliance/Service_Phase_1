# == Schema Information
#
# Table name: agents
#
#  id                   :integer          not null, primary key
#  first_name           :string
#  last_name            :string
#  email                :string
#  address_id           :integer
#  insurance_company_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class AgentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
