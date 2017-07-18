# == Schema Information
#
# Table name: phone_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PhoneType < ActiveRecord::Base
end
