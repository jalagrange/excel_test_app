CarrierWave.configure do |config|
  if Rails.env.production? or Rails.env.development?
    config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => 'AKIAJRIZCC5KYE4O5V4Q',       # required
      :aws_secret_access_key  => '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',       # required
      #:region                 => 'eu-west-1'  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = 'upload_excel'                     # required
    config.fog_public     = false
    config.cache_dir = "upload_excel/tmp/uploads"
  else
    config.storage = :file
    config.enable_processing = false
  end
end
