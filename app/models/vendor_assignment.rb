class VendorAssignment < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :job
  belongs_to :assignment_type

  delegate :name, to: :vendor, prefix: true, allow_nil: true
end
