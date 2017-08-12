# == Schema Information
#
# Table name: affected_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AffectedType < ActiveRecord::Base
end
