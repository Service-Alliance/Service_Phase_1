require 'uri'
require 'net/http'

class TsheetsAdapter
  def initialize
    @tsheets_api = TSheets::API.new do |config|
      config.access_token = TSHEETS_KEY
    end
  end

  # FIXME: Doesn't have to a be a instance method
  # FIXME: I would use Faraday later to simplify things
  def timesheets(user_id)
    url = URI("https://rest.tsheets.com/api/v1/timesheets?user_ids=#{user_id}&start_date=2016-06-06")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = "Bearer #{TSHEETS_KEY}"
    request["cache-control"] = 'no-cache'

    JSON.parse(http.request(request).read_body).tap do |resp|
      EventStore.tsheets(resp)
    end
  end

  def find_users(filters = {})
    tsheets_api.users.where(filters).all.tap { |resp|  EventStore.tsheets(resp)}
  end

  private

  attr_reader :tsheets_api
end
