module Tsheets
  class UsersController < ApplicationController
    def index
      return head :not_acceptable unless request.format.symbol.eql? :json

      @users = TsheetsService.new.find_by_names(params.require(:term))
    end

    def update
      TsheetsAdapter.timesheets(User.find(user_params).tsheets_id)
      render json: 'test'
    end

    private

    def user_params
      params.require(:id)
    end
  end
end
