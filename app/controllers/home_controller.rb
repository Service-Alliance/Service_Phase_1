class HomeController < ApplicationController
  def index
    @active_leads = Job.where(job_status: 1).count
    @active_jobs = Job.where(job_status: 2).count
    @month_calls = Call.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).count
    @ongoing_calls = Call.where(inprogress: true).count


    @activities = PublicActivity::Activity.all

    if current_user.admin?
      @jobs = Job.where(entered_by_id: current_user.id).where("status_id= ? OR status_id= ?", 1, 2)
      render template: 'home/admin'

    elsif current_user.job_coordinator? || current_user.unassigned?
      @jobs = Job.where(entered_by_id: current_user.id).where("status_id= ? OR status_id= ?", 1, 2)
      render template: 'home/job_coordinator'
    elsif current_user.call_rep?
      render template: 'home/call_rep'
    elsif current_user.project_manager?
      @jobs = Job.joins(:job_managers).merge(JobManager.where(:job_manager_id => current_user.id))
      render template: 'home/project_manager'
    elsif current_user.contractor?
      @jobs = Job.eager_load(:subscriptions).where("subscriptions.user_id= ?", current_user.id)
      render template: 'home/contractor'
    elsif current_user.technician?
      render template: 'home/technician'
    elsif current_user.crew_chief?
      render template: 'home/crew_chief'
    end
  end
end
