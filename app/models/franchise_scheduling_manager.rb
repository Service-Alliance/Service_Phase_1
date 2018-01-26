class FranchiseSchedulingManager < ActiveRecord::Base
  belongs_to :user
  belongs_to :franchise
end
