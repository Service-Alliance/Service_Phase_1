json.extract! job, :id, :type_id, :status_id, :entered_by_id, :franchise_id, :details, :notes, :customer_id, :referral_type_id, :created_at, :updated_at
json.url job_url(job, format: :json)