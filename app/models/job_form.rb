class JobForm < ActiveRecord::Base
  belongs_to :form

  def self.create_form(job, form)
      @job = job
      @form = form

      # Generate Hash to send in HTTP request
      @json = JobForm.create_form_hash(@job, @form)

      response = HTTParty.post("https://sandbox.esignlive.com/api/packages/#{@form.package_id}/clone", :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json', "Authorization" => "Basic #{ENV['ESIGN_LIVE']}"}, body: @json)

      id = response.parsed_response['id']
      if id
        job_form = JobForm.create(document_id: id, signed: false, form_id: @form.id, job_id: @job.id)
        return job_form
      end
  end



  def self.download_form(job_form)
    @job_form = job_form
    return response = HTTParty.get("https://sandbox.esignlive.com/api/packages/#{@job_form.document_id}/documents/#{@job_form.form.transaction_id}/pdf", :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json', "Authorization" => "Basic #{ENV['ESIGN_LIVE']}"})
  end

  def check_status

    response = HTTParty.get("https://sandbox.esignlive.com/api/packages/#{document_id}/signingStatus", :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json', "Authorization" => "Basic #{ENV['ESIGN_LIVE']}"})

    return response.parsed_response['status']
  end

  private
  def self.create_form_hash(job, form)
    @job = job
    @form = form

     json = {
      "name": "#{@form.name}",
      "description":"",
      "emailMessage":"",
      "autocomplete":true,
       "roles": [
        {
          "id": @form.signer_id,
          "index": 0,
          "type": "SIGNER",
          "signers": [
            {
              "email": @job.customer.email,
              "firstName": @job.customer.first_name,
              "lastName": @job.customer.last_name
            }
          ],
          "name": "signer1"
        }
      ],
      "settings": {
        "ceremony": {
          "inPerson":true
        }
      },
      "type":"PACKAGE",
      "due":nil,
      "language":"en",
      "status":"SENT"
    }.to_json


    return json
  end
end
