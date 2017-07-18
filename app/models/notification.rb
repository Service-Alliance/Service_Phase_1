# == Schema Information
#
# Table name: notifications
#
#  id          :integer          not null, primary key
#  notify_type :text
#  actor_id    :integer
#  target_id   :integer
#  event_id    :integer
#  job_id      :integer
#  notify_text :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  viewed      :boolean          default(FALSE)
#

class Notification < ActiveRecord::Base
end
