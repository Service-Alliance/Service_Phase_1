class JobCoordinatorsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @job.coordinator_id = job_params[:coordinator_id]
    @job.save
    redirect_to @job
  end

  def destroy
    @job = Job.find(params[:job_id])
    @job.update_attribute :coordinator_id, nil
    redirect_to @job
  end

  private

  def job_params
    params.require(:job).permit(:coordinator_id)
  end
end
