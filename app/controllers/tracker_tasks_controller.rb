class TrackerTasksController < InheritedResources::Base

  private

    def tracker_task_params
      params.require(:tracker_task).permit(:name)
    end
end

