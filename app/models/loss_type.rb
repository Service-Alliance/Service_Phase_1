# == Schema Information
#
# Table name: loss_types
#
#  id         :integer          not null, primary key
#  name       :string
#  tooltip    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LossType < ActiveRecord::Base
  has_many :loss_cause_types
  has_many :loss_causes, through: :loss_cause_types
  has_many :losses
  has_many :jobs, through: :losses
end
