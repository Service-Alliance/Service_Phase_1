class PipelineStatusesController < InheritedResources::Base

  private

    def pipeline_status_params
      params.require(:pipeline_status).permit(:name)
    end
end

