class Job < ActiveRecord::Base
  belongs_to :job_status, foreign_key: :status_id, class_name: "JobStatus"
  belongs_to :job_type, foreign_key: :type_id, class_name: "JobType"
  belongs_to :franchise
  belongs_to :referral_type
  belongs_to :customer
  belongs_to :call
  belongs_to :user, foreign_key: :entered_by_id
  belongs_to :billing_address, foreign_key: :billing_address_id, class_name: "Address"


  def job_loss_type
    return Loss.find_by(job_id: id).try(:loss_type)
  end

  # def job_loss_type
  #   return job_loss.name
  # end


end
