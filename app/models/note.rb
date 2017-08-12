# == Schema Information
#
# Table name: notes
#
#  id            :integer          not null, primary key
#  content       :text
#  noteable_id   :integer
#  noteable_type :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Note < ActiveRecord::Base
  belongs_to :noteable, polymorphic: true
  belongs_to :user
end
