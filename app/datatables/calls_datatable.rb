class CallsDatatable < ApplicationDatatable
  def source
    Call
  end

  def initial_relation
    Call.all
  end

  def filter_model
    @model = model.where(job_id: params[:job_id]) if params[:job_id]
  end

  def search_text
    @model = model.where("customer_phone_number like :search or customer_name ilike :search", search: "%#{params[:search]}%")
  end

  def sort_fields
    {
      id: 'id',
      datetime: 'datetime',
      callrail_id: 'callrail_id',
      customer_phone_number: 'customer_phone_number',
      customer_name: 'customer_name',
      customer_city: 'customer_city',
      utm_campaign: 'utm_campaign',
      duration: 'duration',
      job_id: 'job_id',
      created_at: 'created_at'
    }
  end
end
