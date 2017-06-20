class CustomerVendorsController < InheritedResources::Base

  private

    def customer_vendor_params
      params.require(:customer_vendor).permit(:customer_id, :vendor_id)
    end
end

