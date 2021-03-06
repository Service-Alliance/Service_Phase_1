class JobPolicy < ApplicationPolicy
  attr_reader :user, :job

  def initialize(user, job)
    @user = user
    @job = job
  end

  def new?
    user.admin? || user.job_coordinator? || user.call_rep?
  end

  def create?
    user.admin? || user.job_coordinator? || user.call_rep?
  end

  def index?
    user.admin? || user.job_coordinator?
  end

  def show?
    user.admin? || user.job_coordinator?
  end

  def update?
    user.admin? || user.job_coordinator?
  end
end
