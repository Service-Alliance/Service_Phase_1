class JobsPresenter < BasePresenter
  attr_accessor :paged, :all

  delegate :total_count, :total_pages, :current_page, to: :paged

  def initialize(model, view_context, page)
    super(model, view_context)
    set_up_relation(page)
  end

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
    @referral_types ||= ReferralType.root
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

  [:pending, :active, :invoiced, :dead, :closed].each do |status|
    define_method("#{status}_count") do
      st = JobStatus.find_by(name: status.capitalize)
      st.present? ? all.where(status_id: st.id).count : 0
    end

    define_method("#{status}_value") do
      st = JobStatus.find_by(name: status.capitalize)
      st.present? ? all.where(status_id: st.id).value : 0
    end
  end

  private

  def set_up_relation(page)
    @all = @model
    @paged = @model.includes(:job_detail,
                             :job_coordinator,
                             :user,
                             :franchise,
                             :job_status,
                             :subscriptions,
                             :losses,
                             :pricings,
                             :referral)
                    .includes(customer: {address: :state})
                    .includes(customer: :phones)
                    .includes(subscriptions: :user)
                    .includes(losses: :loss_type)
                    .includes(referral: :referral_type)
                    .page(page)
                    .order('fnol_received DESC')
  end
end
