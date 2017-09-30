class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :job

  delegate :full_name, to: :user, allow_nil: true, prefix: true
end
