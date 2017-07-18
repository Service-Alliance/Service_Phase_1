# == Schema Information
#
# Table name: notify_types
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class NotifyType < ActiveRecord::Base
end
