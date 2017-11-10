json.extract! work_order, :id, :job_id, :to, :name, :typed_by, :job_start, :job_name, :location, :contact, :insurance, :claim_number, :crew, :required, :referral, :scope_of_work, :created_at, :updated_at
json.url job_work_order_url(work_order.job_id, work_order.id, format: :json)
