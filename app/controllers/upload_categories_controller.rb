class UploadCategoriesController < InheritedResources::Base

  private

    def upload_category_params
      params.require(:upload_category).permit(:name)
    end
end

