class LossType < ActiveRecord::Base
  has_many :loss_cause_types
  has_many :loss_causes, through: :loss_cause_types
end
