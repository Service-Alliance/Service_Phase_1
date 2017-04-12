class PipelineController < ApplicationController
  def index
    # @jobs = Job.where("status_id= ? OR status_id= ?", 1, 2)
    @search = Job.where("status_id= ? OR status_id= ?", 1, 2).order('created_at DESC').search(params[:q])
    @jobs = @search.result
  end

  private

end
