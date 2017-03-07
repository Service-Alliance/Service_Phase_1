module ContactAssignmentsHelper
  def new_or_view_job_contact_path(job, contact)
    contact != [] ? job_contact_assignments_path(job) : new_job_contact_assignment_path(job)
  end
end
