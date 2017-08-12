# == Schema Information
#
# Table name: losses
#
#  id                       :integer          not null, primary key
#  received_by              :string
#  loss_occurred            :datetime
#  fnol_received            :datetime
#  customer_called          :date
#  job_id                   :integer
#  loss_type_id             :integer
#  loss_cause_id            :integer
#  standing_water_id        :integer
#  water_available_id       :integer
#  electricity_available_id :integer
#  source_off_id            :integer
#  visible_mold_id          :integer
#  source_cause             :text
#  previous_water_damage_id :integer
#  cleaning_type            :text
#  affected_square_footage  :string
#  notes                    :text
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class Loss < ActiveRecord::Base
  belongs_to :standing_water, foreign_key: :standing_water_id, class_name: "AffectedType"
  belongs_to :water_available, foreign_key: :water_available_id, class_name: "AffectedType"
  belongs_to :electricity_available, foreign_key: :electricity_available_id, class_name: "AffectedType"
  belongs_to :source_off, foreign_key: :source_off_id, class_name: "AffectedType"
  belongs_to :visible_mold, foreign_key: :visible_mold_id, class_name: "AffectedType"
  belongs_to :previous_water_damage, foreign_key: :previous_water_damage_id, class_name: "AffectedType"
  belongs_to :loss_type
  belongs_to :loss_cause

  belongs_to :job
  has_one :customer, through: :job

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

end
