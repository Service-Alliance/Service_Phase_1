json.extract! job_form, :id, :document_id, :signed, :name, :link, :created_at, :updated_at
json.url job_form_url(job_form, format: :json)