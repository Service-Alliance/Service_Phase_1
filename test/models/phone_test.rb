# == Schema Information
#
# Table name: phones
#
#  id             :integer          not null, primary key
#  number         :string
#  type_id        :integer
#  extension      :string
#  phoneable_id   :integer
#  phoneable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
