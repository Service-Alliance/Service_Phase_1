class PipelineController < ApplicationController
  def index
    @jobs = Job.where("status_id= ? OR status_id= ?", 1, 2)
  end

  private

end
