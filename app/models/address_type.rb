# == Schema Information
#
# Table name: address_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AddressType < ActiveRecord::Base
end
