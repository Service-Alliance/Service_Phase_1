json.total @dt.count
json.rows do
  json.array! @dt.model do |job|
    json.extract! job, :id, :job_status_name, :name, :customer_full_name, :claim_number, :job_loss_type_name, :insurance_company_name, :created_at
  end
end
