class HomeController < ApplicationController
  def index
    @active_leads = Job.where(job_status: 1)
    @active_jobs = Job.where(job_status: 2)
    @month_calls = Call.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).count
  end
end
