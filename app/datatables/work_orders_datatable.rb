class WorkOrdersDatatable < ApplicationDatatable
  def source
    WorkOrder
  end

  def initial_relation
    WorkOrder.active.joins(:job).where.not(jobs: {status_id: nil})
  end

  def included_associations
    [:job, :vendor, :crew, job: [:job_status, :franchise, :customer, customer: [:address, address: :state]]]
  end

  def filter_model
    @model = model.where(jobs: { franchise_id: params[:franchise_id] }) if params[:franchise_id]
  end

  def sort_fields
    {
      created_at: 'work_orders.created_at',
      updated_at: 'work_orders.updated_at',
      id: 'work_orders.id',
      state: 'work_orders.state',
      job_start: 'work_orders.job_start',
      job_id: 'jobs.id',
      job_name: 'jobs.name',
      typed_by: 'work_orders.typed_by',
      contact: 'work_orders.contact',
      job_location: 'addresses.address',
      referral: 'work_orders.referral',
      required: 'work_orders.required',
      scope_of_work: 'work_orders.scope_of_work',
      job_name: 'jobs.name'
    }
  end
end
