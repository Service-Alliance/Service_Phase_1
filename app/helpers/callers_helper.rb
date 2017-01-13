# View helpers for callers
module CallersHelper
  def new_or_view_job_caller_path(job, caller)
    caller ? job_caller_path(job, caller) : new_job_caller_path(job)
  end
end
