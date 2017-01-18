module CustomersHelper
  def new_or_view_customer_path(job, customer)
    customer ? customer_path(customer, job_id: job.id) : new_customer_path(job_id: job.id)
  end
end
