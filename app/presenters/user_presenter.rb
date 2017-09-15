class UserPresenter < BasePresenter
  def jobs_owned_by_user
    jobs.owned_by(@model)
  end

  def jobs_entered_by_user
    jobs.entered_by(@model)
  end

  private

  def jobs
    Job.latest_first.limit(20)
  end
end
