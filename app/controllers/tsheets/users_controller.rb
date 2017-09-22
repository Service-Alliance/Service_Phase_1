module Tsheets
  class UsersController < ApplicationController
    def index
      @users = TsheetsService.new.find_by_names(params.require(:term))
    end
  end
end
