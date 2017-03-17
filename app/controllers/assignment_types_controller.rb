class AssignmentTypesController < InheritedResources::Base

  private

    def assignment_type_params
      params.require(:assignment_type).permit(:name)
    end
end

