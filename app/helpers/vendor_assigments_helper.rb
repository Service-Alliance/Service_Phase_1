module VendorAssigmentsHelper
  def new_or_view_job_vendor_path(job, vendor)
    vendor != [] ? job_vendor_assignments_path(job) : new_job_vendor_assignment_path(job)
  end
end
