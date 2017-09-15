class VendorAssignment < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :job
  belongs_to :assignment_type
end
