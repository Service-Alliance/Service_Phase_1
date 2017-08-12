# == Schema Information
#
# Table name: trackers
#
#  id              :integer          not null, primary key
#  trackable_id    :integer
#  trackable_type  :string
#  tracker_task_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  child_id        :integer
#  user_id         :integer
#  note            :text
#

require 'test_helper'

class TrackerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
