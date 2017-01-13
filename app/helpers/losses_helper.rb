# View helper for losses
module LossesHelper
  def new_or_view_job_loss_path(job, loss)
    loss ? job_loss_path(job, loss) : new_job_loss_path(job)
  end
end
