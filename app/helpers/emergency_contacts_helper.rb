module EmergencyContactsHelper
  def new_or_view_job_emergency_contact_path(job, emergency_contact)
    emergency_contact ? job_emergency_contact_path(job, emergency_contact) : new_job_emergency_contact_path(job)
  end
end
