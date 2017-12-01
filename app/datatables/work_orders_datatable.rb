class WorkOrdersDatatable < ApplicationDatatable
  def initial_relation
    WorkOrder.joins(:job).where.not(jobs: {status_id: nil})
  end

  def included_associations
    [:job, :vendor, :crew, job: [:job_status, :franchise, :customer]]
  end

  def filter_model
    pp params[:franchise_id]
    @model = model.where(jobs: { franchise_id: params[:franchise_id] }) if params[:franchise_id]
  end

  def sort_fields
    {
      name: 'name',
      job_status_name: 'job_statuses.name',
      job_name: 'jobs.name',
      state: 'state',
    }
  end
end
