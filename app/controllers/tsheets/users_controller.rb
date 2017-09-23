module Tsheets
  class UsersController < ApplicationController
    def index
      return head :not_acceptable unless request.format.symbol.eql? :json

      @users = TsheetsService.new.find_by_names(params.require(:term))
    end
  end
end
