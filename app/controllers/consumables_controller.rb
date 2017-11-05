class ConsumablesController < InheritedResources::Base

  private

    def consumable_params
      params.require(:consumable).permit(:name, :purchase_unit, :cost_per_purchase_unit, :cost_per_unit)
    end
end

