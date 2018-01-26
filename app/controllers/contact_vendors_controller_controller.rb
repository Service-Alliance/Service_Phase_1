class ContactVendorsControllerController < ApplicationController
	  private

    def contact_vendors_params
      params.require(:contact_vendor).permit(:contact_id, :vendor_id)
    end
end
