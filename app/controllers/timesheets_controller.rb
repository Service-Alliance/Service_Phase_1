class TimesheetsController < ApplicationController
  def index
    binding.pry
    render json: {test:'test'}
  end
end
