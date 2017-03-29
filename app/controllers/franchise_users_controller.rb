class FranchiseUsersController < InheritedResources::Base

  private

    def franchise_user_params
      params.require(:franchise_user).permit(:user_id, :franchise_id)
    end
end

