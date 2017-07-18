# == Schema Information
#
# Table name: loss_cause_types
#
#  id            :integer          not null, primary key
#  loss_type_id  :integer
#  loss_cause_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class LossCauseType < ActiveRecord::Base
  belongs_to :loss_cause
  belongs_to :loss_type
end
