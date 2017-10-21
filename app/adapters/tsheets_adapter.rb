class TsheetsAdapter
  def initialize
    @tsheets_api = TSheets::API.new do |config|
      config.access_token = TSHEETS_KEY
    end
  end

  def timesheets(for_user)
    tsheets_api.timesheets.where(user_ids: [for_user])
  end

  def find_users(filters = {})
    response = tsheets_api.users.where(filters).all
    EventStore.tsheets(response)

    response
  end

  private

  attr_reader :tsheets_api
end
