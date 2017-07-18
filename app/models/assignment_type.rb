# == Schema Information
#
# Table name: assignment_types
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AssignmentType < ActiveRecord::Base
end
