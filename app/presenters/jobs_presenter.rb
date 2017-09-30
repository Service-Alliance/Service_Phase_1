class JobsPresenter < BasePresenter
  def all_franchises
    @franchises ||= Franchise.all
    @franchises
  end

  def all_insurance_companies
    @insurance_companies ||= InsuranceCompany.all
    @insurance_companies
  end

  def all_job_statuses
    @job_statuses ||= JobStatus.all
    @job_statuses
  end

  def all_users
    @users ||= User.all
    @users
  end

  def all_loss_types
    @loss_types ||= LossType.all
    @loss_types
  end

  def all_states
    @states ||= State.all
    @states
  end

  def all_referral_types
    @referral_types ||= ReferralType.all
    @referral_types
  end

  def all_agents
    @agents ||= Agent.all
    @agents
  end

  def all_adjusters
    @adjusters ||= Adjuster.all
    @adjusters
  end
end
