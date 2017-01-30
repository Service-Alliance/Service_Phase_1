class OverviewController < ApplicationController
  before_action :set_job
  def index
  end

  private
  def set_job
    @job = Job.find(params[:job_id])
  end
end
