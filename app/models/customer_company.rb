class CustomerCompany < ActiveRecord::Base
  belongs_to :customer
  belongs_to :company
end