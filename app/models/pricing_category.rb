# == Schema Information
#
# Table name: pricing_categories
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PricingCategory < ActiveRecord::Base
end
