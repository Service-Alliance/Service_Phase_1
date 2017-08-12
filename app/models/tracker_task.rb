# == Schema Information
#
# Table name: tracker_tasks
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TrackerTask < ActiveRecord::Base
end
