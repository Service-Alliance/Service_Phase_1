class AdwordsApiAdapter
  require 'adwords_api'

  API_VERSION = :v201710.freeze

  def query_campaigns(customer_id, fields = ['Id', 'Name', 'Status', 'budget'])
    campaign_service(customer_id).get({:fields => fields})
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
        oauth2_client_id: '285881768207-5mutuapstmnhaeuqiffpmetjbrd2td59.apps.googleusercontent.com',
        oauth2_client_secret: 'V796ZFiIpofaXIq-j_oDHqcq',
        developer_token: 'UihCBT9tJ_lOHfcEfhTyaA',
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
end
