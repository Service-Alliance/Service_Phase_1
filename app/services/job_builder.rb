class JobBuilder
  class SaveError < StandardError; end

  def self.call(job_params, caller_params, address_params, phone_params, company_name, call_id, current_user_id, customer_same_as_caller)
    job = Job.new(job_params)
    job.entered_by_id = current_user_id
    caller = Caller.new(caller_params)
    address = Address.new(address_params)

    call = Call.find_by(id: call_id) if call_id
    job.franchise_id = FranchiseZipcode.detect_franchise(address_params['zip_code'])
    job.pipeline_status_id = 1

    job.caller = caller
    caller.address = address

    if company_name.present?
      company = Company.find_or_initialize_by(name: company_name) if company_name.present?
      company.address = address if company.address.blank?
      company.save
    end

    if call
      job.calls << call
    end
    caller.add_company(company)

    caller.phones.destroy_all

    phone_params.fetch('type_ids', []).count.times do |index|
      unless phone_params['numbers'][index] == ''
        caller.phones.build(type_id: phone_params['type_ids'][index],
                             number: phone_params['numbers'][index],
                             extension: phone_params['extensions'][index])
      end
    end

    Customer.same_as_caller(job) if customer_same_as_caller

    job.save
    job
  end
end
