class TrackersController < InheritedResources::Base

  private

    def tracker_params
      params.require(:tracker).permit(:trackable_id, :trackable_type)
    end
end

