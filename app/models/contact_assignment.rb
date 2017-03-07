class ContactAssignment < ActiveRecord::Base
  belongs_to :contact
  belongs_to :job
end
