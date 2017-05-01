class NotifyTypesController < InheritedResources::Base

  private

    def notify_type_params
      params.require(:notify_type).permit(:name)
    end
end

