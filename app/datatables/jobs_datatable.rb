class JobsDatatable < ApplicationDatatable
  def source
    Job
  end

  def initial_relation
    Job.where.not(status_id: nil)
  end

  def included_associations
    [:job_status, :job_type, :franchise, :job_detail, :customer, :losses, {job_detail: :insurance_company}, {losses: :loss_type}]
  end

  def filter_model
    @model = model.where(franchise_id: params[:franchise_id]) if params[:franchise_id].present?
    @model = model.no_activity if params[:no_activity].present?
    @model = model.call_rep_jobs if params[:call_rep_jobs].present?
    @model = model.unassigned if params[:unassigned].present?
    @model = model.invoiced_collections_unassigned if params[:invoiced_collections_unassigned].present?
    @model = model.collections(params[:collections]) if params[:collections].present?
  end

  def sort_fields
    {
      name: 'jobs.name',
      job_status_name: 'job_statuses.name',
      customer_full_name: ['customers.first_name', 'customers.last_name'],
      claim_number: "job_details.claim_number",
      job_loss_type_name: 'loss_types.name',
      insurance_company_name: 'insurance_companies.name',
      created_at: 'jobs.created_at'
    }
  end
end
