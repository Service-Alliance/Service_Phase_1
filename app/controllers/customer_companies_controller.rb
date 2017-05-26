class CustomerCompaniesController < ApplicationController

  private

    def customer_company_params
      params.require(:customer_company).permit(:company_id, :customer_id)
    end
end
