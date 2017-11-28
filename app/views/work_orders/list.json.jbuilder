json.array! @work_orders do |work_order|
  json.extract! work_order, :id, :job_id, :name, :typed_by, :job_start, :job_name, :contact, :telephone, :insurance,
  :claim_number, :crew_names, :required, :referral, :scope_of_work, :created_at, :updated_at, :vendor_name,
  :job_location, :crew_names, :number_of_technicians, :number_of_crew_chiefs, :estimated_hours
  json.url job_work_order_url(work_order.job_id, work_order.id, format: :json)
end
