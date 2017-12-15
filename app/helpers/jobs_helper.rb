module JobsHelper
  def display_subscriptions(job)
    sub = job.subscriptions.first.try(:user_full_name)
    sub += " (+ #{job.subscriptions.size-1})" if job.subscriptions.size > 1
    sub
  end

  def display_insurance(job)
    return 'Self Pay' if job.self_pay?
    return job.insurance_company_name if job.insurance_company_name.present?
    return 'TBD/Unknown' if job.self_pay_unknown?
    ''
  end

  def job_link(job)
    link_to job.name.present? ? job.name : 'Show', job
  end
end
