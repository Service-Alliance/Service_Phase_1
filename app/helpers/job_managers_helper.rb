  module JobManagersHelper
    def new_or_view_job_manager_path(job, manager)
      manager != [] ? job_job_managers_path(job) : new_job_job_manager_path(job)
    end
  end
