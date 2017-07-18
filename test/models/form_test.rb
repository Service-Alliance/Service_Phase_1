# == Schema Information
#
# Table name: forms
#
#  id             :integer          not null, primary key
#  name           :string
#  package_id     :string
#  transaction_id :string
#  signer_id      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class FormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
