# == Schema Information
#
# Table name: losses
#
#  id                       :integer          not null, primary key
#  received_by              :string
#  loss_occurred            :datetime
#  fnol_received            :datetime
#  customer_called          :date
#  job_id                   :integer
#  loss_type_id             :integer
#  loss_cause_id            :integer
#  standing_water_id        :integer
#  water_available_id       :integer
#  electricity_available_id :integer
#  source_off_id            :integer
#  visible_mold_id          :integer
#  source_cause             :text
#  previous_water_damage_id :integer
#  cleaning_type            :text
#  affected_square_footage  :string
#  notes                    :text
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'test_helper'

class LossTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
