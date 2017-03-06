class HomeController < ApplicationController
  def index
    @active_leads = Job.where(job_status: 1).count
    @active_jobs = Job.where(job_status: 2).count
    @month_calls = Call.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).count
    @ongoing_calls = Call.where(inprogress: true).count


    @activities = PublicActivity::Activity.all

    if current_user.admin?
      render template: 'home/admin'
    elsif current_user.job_coordinator?
      render template: 'home/job_coordinator'
    elsif current_user.call_rep?
      render template: 'home/call_rep'
    end
  end
end
