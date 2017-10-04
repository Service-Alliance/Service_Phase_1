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

  delegate :name, to: :loss_type, allow_nil: true, prefix: true

  after_save :update_job_fnol_received

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  private

  def update_job_fnol_received
    job.update_attributes(fnol_received: fnol_received) if should_update_job_fnol_received?
  end

  def should_update_job_fnol_received?
    job.present? && fnol_received.present?
  end
end
