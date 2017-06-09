class PricingCategoriesController < InheritedResources::Base

  private

    def pricing_category_params
      params.require(:pricing_category).permit(:name)
    end
end

