class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  include PublicActivity::StoreController
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :verify_user


  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def verify_user
    if current_user && current_user.contractor? && params[:job_id]
      subs = current_user.subscriptions.pluck(:job_id)
      @job = Job.find(params[:job_id])
      if subs.include?(@job.id)
        true
      else
        redirect_to "/"
      end
    else
      true
    end
  end
end
