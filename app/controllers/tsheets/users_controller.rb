module Tsheets
  class UsersController < ApplicationController
    respond_to :json

    def index
      @users = TsheetsService.new.find_by_names(params.require(:term))
    end
  end
end
