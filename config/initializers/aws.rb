CarrierWave.configure do |config|
  SW_STORAGE = Rails.env.production? ? :fog : :file

  if Rails.env.production?
    config.fog_provider = 'fog/aws'                     # required
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV.fetch['AWS_ACCESS_KEY'],            # required
      aws_secret_access_key: ENV.fetch['AWS_SECRET_KEY'],                        # required
      region:                'us-west-2',
      path_style:            true

    }
    config.fog_directory  = 'servicealliance'                          # required
    config.fog_public     = false                                        # optional, defaults to true
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
  elsif Rails.env.test?
    config.enable_processing = false
  end
end


