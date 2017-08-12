# == Schema Information
#
# Table name: referral_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ReferralType < ActiveRecord::Base
end
