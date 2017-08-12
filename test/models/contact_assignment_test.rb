# == Schema Information
#
# Table name: contact_assignments
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  job_id     :integer
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ContactAssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
