class Form < ActiveRecord::Base

  def self.create_form(job, form)

  end

  def create_form_hash(job, form)
    @job = job
    @form = form
    return {
      "name": @form.name,
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
    }
  end
end
