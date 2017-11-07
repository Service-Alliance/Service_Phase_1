json.array! @work_orders do |work_order|
  json.extract! work_order, :id, :job_id, :name, :typed_by, :job_start, :job_name, :contact, :location, :insurance, :claim_number, :crew, :required, :referral, :scope_of_work, :created_at, :updated_at
  json.url job_work_order_url(work_order.job_id, work_order.id, format: :json)
end
