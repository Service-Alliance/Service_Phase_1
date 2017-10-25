class JobBuilder
  class SaveError < StandardError; end

  def self.call(job_params, caller_params, address_params, phone_params, company_name, call_id, current_user_id)
    job = Job.new(job_params)
    job.entered_by_id = current_user_id
    caller = Caller.new(caller_params)
    address = Address.new(address_params)

    call = Call.find_by(id: call_id) if call_id
    job.referral_type_id = nil if job.try(:referral_type).try(:name) != 'Servpro Employee'

    franchise = FranchiseZipcode.find_by(zip_code: address_params['zip_code'])
    if franchise
      job.franchise_id = franchise.id
    end

    job.pipeline_status_id = 1

    raise SaveError unless caller.save
    address.save
    raise SaveError unless job.save

    if company_name.present?
      company = Company.find_or_create_by(name: company_name) if company_name.present?
      company.address = address if company.address.blank?
      company.save!
    end

    if call
      call.save
    end
    caller.job_id = job.id
    caller.address_id = address.id
    caller.add_company(company)
    caller.save!


    caller.phones.destroy_all


    phone_params.fetch('type_ids', []).count.times do |index|
      unless phone_params['numbers'][index] == ''
        caller.phones.create(type_id: phone_params['type_ids'][index],
                             number: phone_params['numbers'][index],
                             extension: phone_params['extensions'][index])
      end
    end

    job
  end
end
