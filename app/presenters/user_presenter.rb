class UserPresenter < BasePresenter
  def jobs_owned_by_user
    jobs.owned_by(@model)
  end

  def jobs_entered_by_user
    jobs.entered_by(@model)
  end

  def all_departments
    Department.all.order(:name).pluck(:name, :id)
  end

  def all_roles
    Role.all.order(:name).pluck(:name, :id)
  end

  def all_rate_periods
    UserRate.periods.keys
  end

  private

  def jobs
    Job.latest_first.limit(20)
  end
end
