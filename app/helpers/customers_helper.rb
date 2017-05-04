module CustomersHelper
  def new_or_view_customer_path(job, customer)
    customer ? job_customer_path(job.id, customer.id) : new_customer_path(job_id: job.id)
  end
end
