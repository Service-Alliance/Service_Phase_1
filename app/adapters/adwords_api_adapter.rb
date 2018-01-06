class AdwordsApiAdapter
  require 'adwords_api'

  API_VERSION = :v201710.freeze
  ADWORDS_CLIENT_ID = ENV.fetch('ADWORDS_CLIENT_ID')
  ADWORDS_CLIENT_SECRET = ENV.fetch('ADWORDS_CLIENT_SECRET')
  ADWORDS_DEVELOPER_TOKEN = ENV.fetch('ADWORDS_DEVELOPER_TOKEN')

  def query_campaigns(customer_id, fields = ['Id', 'Name', 'Status', 'budget'])
    campaign_service(customer_id).get({:fields => fields})
  end

  def account_performance_report(customer_id)
    query = "SELECT AccountDescriptiveName, AdNetworkType1, Impressions, Ctr, Clicks, Cost, AverageCpc, Conversions, ConversionRate "
    query = query + "FROM ACCOUNT_PERFORMANCE_REPORT "
    query = query + "DURING #{date_range}"
    generate_report(customer_id, query)
  end

  private

  def campaign_service(customer_id)
    adwords_api(customer_id).service(:CampaignService, API_VERSION)
  end

  def adwords_api(customer_id)
    AdwordsApi::Api.new(connection_hash(customer_id))
  end

  def connection_hash(customer_id)
    {
      :authentication => {
        method: 'OAuth2',
        oauth2_client_id: ADWORDS_CLIENT_ID,
        oauth2_client_secret: ADWORDS_CLIENT_SECRET,
        developer_token: ADWORDS_DEVELOPER_TOKEN,
        client_customer_id: customer_id,
        user_agent: 'ServproApplication',
        oauth2_token: {
          access_token: 'ya29.Gls5BYkdCE76zW4F6wWKRcwDWHx_M1s-0lxzqn6uoEZIqfcG44vku1-ftkldzSi5HU8Tga8GS-OBm7NepgP0ndYyJX8Kun63ygvJIVL090BAr8N2zBJ9PC3WHi83',
          refresh_token: '1/yP-ysyrFfS8G7Cp3Z46QSKdqb6FrhH58lrB-YTCqrf6xFK7UIJfxb4Co2qzZgX6n',
          issued_at: '2018-01-05 14:29:05.403209000 +09:00',
          expires_in: 3600,
          id_token: ''
        }
      },
      :service => {
        :environment => 'PRODUCTION'
      }
    }
  end

  def generate_report(customer_id, query)
    adwords_api = adwords_api(customer_id)
    report_utils = adwords_api.report_utils(API_VERSION)

    adwords_api.skip_report_header = true
    adwords_api.skip_column_header = false
    adwords_api.skip_report_summary = false
    adwords_api.include_zero_impressions = true

    result = report_utils.download_report_with_awql(query, 'CSV')
    pp result
    CSV.new(result, headers: true)
  end

  def date_range
    '%s,%s' % [
      (Date.today - 7).to_datetime.strftime('%Y%m%d'),
      (Date.today - 1).to_datetime.strftime('%Y%m%d')
    ]
  end
end
