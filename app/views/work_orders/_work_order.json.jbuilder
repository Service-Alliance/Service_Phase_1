json.extract! work_order, :id, :job_id, :to, :name, :date, :typed_by, :job_start, :job_name, :job_location, :telephone, :contact, :insurance, :claim_number, :crew, :approx_time_on_loss, :required, :referral, :franchise_location, :scope_of_work, :job_manager_contact_info, :created_at, :updated_at
json.url work_order_url(work_order, format: :json)
