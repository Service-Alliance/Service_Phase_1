# == Schema Information
#
# Table name: loss_causes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LossCause < ActiveRecord::Base
  has_many :loss_types
end
