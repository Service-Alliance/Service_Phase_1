# == Schema Information
#
# Table name: job_statuses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class JobStatus < ActiveRecord::Base
end
