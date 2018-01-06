class AdwordsController < ApplicationController
  before_action :setup_service
  before_action :authenticate_user!

  def index
    @data = @service.query_campaigns('527-084-8197')
  end

  private

  def setup_service
    @service = AdwordsApiAdapter.new
  end
end
