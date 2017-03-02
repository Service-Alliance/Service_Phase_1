# View helper for losses
module LossesHelper
  def new_or_view_job_loss_path(job, loss)
    loss ? job_losses_path(job) : new_job_loss_path(job)
  end
end
