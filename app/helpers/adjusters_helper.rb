module AdjustersHelper
  def new_or_view_adjuster_path(job, adjuster)
    adjuster ? adjuster_path(adjuster, job_id: job.id) : new_adjuster_path(job_id: job.id)
  end
end
