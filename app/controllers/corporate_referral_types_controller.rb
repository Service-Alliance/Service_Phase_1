class CorporateReferralTypesController < InheritedResources::Base

  private

    def corporate_referral_type_params
      params.require(:corporate_referral_type).permit(:name)
    end
end

