# == Schema Information
#
# Table name: pricings
#
#  id                  :integer          not null, primary key
#  price               :decimal(8, 2)
#  pricing_category_id :integer
#  description         :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  current_status_id   :integer
#  job_id              :integer
#

require 'test_helper'

class PricingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
