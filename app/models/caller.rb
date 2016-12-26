class Caller < ActiveRecord::Base
  belongs_to :job
  belongs_to :address
end
