class CallerCompany < ActiveRecord::Base
  belongs_to :caller, required: true
  belongs_to :company, required: true
end
