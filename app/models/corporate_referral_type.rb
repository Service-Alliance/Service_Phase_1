# == Schema Information
#
# Table name: corporate_referral_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CorporateReferralType < ActiveRecord::Base
end
