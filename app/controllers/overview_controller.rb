class OverviewController < ApplicationController
  before_action :set_job
  def index
    @caller = Caller.find_by(job_id: @job.id)
    @address = @caller.try(:address)
      @customer = @job.customer
  end

  private
  def set_job
    @job = Job.find(params[:job_id])
  end
end
