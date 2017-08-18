module Tsheets
  class UsersController < ApplicationController
    def index
      @users = TsheetsService.find_by_names(term_params)
    end
  end

  private

  def term_params
    params.require(:term)
  end
end
