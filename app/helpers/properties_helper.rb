# View helper for properties
module PropertiesHelper
  def new_or_view_job_property_path(job, property)
    property ? job_property_path(job, property) : new_job_property_path(job)
  end
end
