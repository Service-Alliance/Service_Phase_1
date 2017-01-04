CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                     # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['AWS_ACCESS_KEY'],            # required
    aws_secret_access_key: ENV['AWS_SECRET_KEY'],                        # required
    region:                'us-west-2',
    path_style:            true            
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'servicealliance'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
