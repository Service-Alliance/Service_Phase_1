class UserPolicy < ApplicationPolicy
  attr_reader :user, :target_user

  def initialize(user, target_user)
    @user = user
    @target_user = target_user
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    user.admin?
  end

  def administer_financials?
    user.admin?
  end
end
