# == Schema Information
#
# Table name: job_managers
#
#  id                   :integer          not null, primary key
#  job_manager_id       :integer
#  schedule_date        :date
#  start_time           :time
#  end_time             :time
#  job_id               :integer
#  manager_confirmation :boolean          default(FALSE)
#  note                 :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class JobManager < ActiveRecord::Base
  belongs_to :job_manager, class_name: "User"
  include PublicActivity::Model
end
