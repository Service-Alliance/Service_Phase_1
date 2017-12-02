class JobManagersDatatable < ApplicationDatatable
  def source
    JobManager
  end

  def initial_relation
    JobManager.joins(:job_manager)
  end

  def included_associations
    [:job, :job_manager]
  end

  def filter_model
  end

  def sort_fields
    {
      id: 'job_managers.id',
      user_id: 'users.id',
      first_name: 'users.first_name',
      last_name: 'users.last_name',
      job_id: 'jobs.id',
      job_name: 'jobs.name',
      schedule_date: 'schedule_date',
      manager_confirmation: 'manager_confirmation'
    }
  end
end
