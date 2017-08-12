# == Schema Information
#
# Table name: customer_companies
#
#  id          :integer          not null, primary key
#  company_id  :integer
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CustomerCompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
