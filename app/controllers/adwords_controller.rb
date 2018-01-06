class AdwordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @franchises = Franchise.where.not(adwords_client_id: nil)
  end
end
