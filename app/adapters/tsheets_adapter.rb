require 'uri'
require 'net/http'

class TsheetsAdapter
  def initialize
    @tsheets_api = TSheets::API.new do |config|
      config.access_token = TSHEETS_KEY
    end
  end

  # Doesn't have to a be a instance method
  def timesheets(user_id)
    # Due to issues i was unable to fix in original library
    #   https://github.com/tsheets/api_ruby/issues/5
    # I've re-implemented parts of api with Net::HTTP
    # FIXME: I would use Faraday later for this

    url = URI("https://rest.tsheets.com/api/v1/timesheets?user_ids=#{user_id}&start_date=2016-06-06")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = "Bearer #{TSHEETS_KEY}"
    request["cache-control"] = 'no-cache'

    result = JSON.parse(http.request(request).read_body)

    EventStore.tsheets(result)

    result
  end

  def find_users(filters = {})
    response = tsheets_api.users.where(filters).all
    EventStore.tsheets(response)

    response
  end

  private

  attr_reader :tsheets_api
end
