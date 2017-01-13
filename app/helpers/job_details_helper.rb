module JobDetailsHelper
  def new_or_view_job_detail_path(job, detail)
    detail ? job_job_detail_path(job, detail) : new_job_job_detail_path(job)
  end
end
