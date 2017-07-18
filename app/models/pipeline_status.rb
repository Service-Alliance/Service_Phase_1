# == Schema Information
#
# Table name: pipeline_statuses
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PipelineStatus < ActiveRecord::Base
end
