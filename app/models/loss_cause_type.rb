class LossCauseType < ActiveRecord::Base
  belongs_to :loss_cause
  belongs_to :loss_type
end
