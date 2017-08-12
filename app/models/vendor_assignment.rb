# == Schema Information
#
# Table name: vendor_assignments
#
#  id                 :integer          not null, primary key
#  vendor_id          :integer
#  job_id             :integer
#  note               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  assignment_type_id :integer
#

class VendorAssignment < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :assignment_type
end
