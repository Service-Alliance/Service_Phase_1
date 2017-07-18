# == Schema Information
#
# Table name: contact_assignments
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  job_id     :integer
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactAssignment < ActiveRecord::Base
  belongs_to :contact
  belongs_to :job
end
