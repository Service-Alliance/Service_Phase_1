# == Schema Information
#
# Table name: customer_addresses
#
#  id              :integer          not null, primary key
#  address_id      :integer
#  customer_id     :integer
#  address_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class CustomerAddress < ActiveRecord::Base
end
