class ContactCompaniesControllerController < ApplicationController
	  private

    def contact_company_params
      params.require(:contact_company).permit(:company_id, :contact_id)
    end
end
