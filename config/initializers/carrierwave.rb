CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                        # required
    config.fog_public = false
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV["AKIARU4FWNE7CKNKY2IC"],        # required
      aws_secret_access_key: ENV["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"],        # required
    }
    config.fog_directory  = ENV["dan-pham-nomster"]              # required
  end