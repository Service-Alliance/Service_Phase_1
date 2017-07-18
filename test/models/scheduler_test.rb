# == Schema Information
#
# Table name: schedulers
#
#  id                      :integer          not null, primary key
#  event_date              :date
#  start_time              :time
#  end_time                :time
#  assigned_to_user_id     :integer
#  job_id                  :integer
#  scheduler_event_type_id :integer
#  notes                   :text
#  title                   :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'test_helper'

class SchedulerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
