# == Schema Information
#
# Table name: ticsheets
#
#  id          :integer          not null, primary key
#  key_code    :integer
#  description :string
#  uom         :string
#  percentage  :integer
#  quantity    :integer
#  job_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class TicsheetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
