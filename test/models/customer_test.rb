# == Schema Information
#
# Table name: customers
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  address_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  owner_id        :integer
#  sharp_spring_id :text
#  company_name    :text
#  title           :text
#  website         :text
#  category        :text
#  sub_category    :text
#  sharpspring_id  :text
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
