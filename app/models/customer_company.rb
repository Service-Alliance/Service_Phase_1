# == Schema Information
#
# Table name: customer_companies
#
#  id          :integer          not null, primary key
#  company_id  :integer
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CustomerCompany < ActiveRecord::Base
  belongs_to :customer
  belongs_to :company
end
