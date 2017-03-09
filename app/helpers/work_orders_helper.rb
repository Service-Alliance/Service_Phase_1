module WorkOrdersHelper
  def new_or_view_job_work_order_path(job, work_order)
    work_order ? job_work_orders_path(job) : new_job_work_order_path(job)
  end
end
