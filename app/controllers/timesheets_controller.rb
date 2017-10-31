class TimesheetsController < ApplicationController
  def index
    @timesheets = User.find(user_params).timesheets

    gon.jbuilder
  end

  private

  def user_params
    params.require(:user_id)
  end
end
