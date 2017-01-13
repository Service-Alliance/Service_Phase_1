# Job
class Job < ActiveRecord::Base
  belongs_to :job_status, foreign_key: :status_id, class_name: 'JobStatus'
  belongs_to :job_type, foreign_key: :type_id, class_name: 'JobType'
  belongs_to :franchise
  belongs_to :referral_type
  belongs_to :customer
  has_one :call
  belongs_to :user, foreign_key: :entered_by_id
  belongs_to :billing_address, foreign_key: :billing_address_id,
                               class_name: 'Address'
  has_one :property
  has_one :caller
  has_one :loss

  # Activity Tracking activated
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  def job_loss_type
    Loss.find_by(job_id: id).try(:loss_type)
  end

  def insurance_details
    JobDetail.find_by(job_id: id).try(:insurance_company)
  end
end
