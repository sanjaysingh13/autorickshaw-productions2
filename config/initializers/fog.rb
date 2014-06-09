CarrierWave.configure do |config|
  config.fog_credentials = {
  :provider => 'AWS',
  :aws_access_key_id => ENV['S3_KEY'],
  :aws_secret_access_key => ENV['S3_SECRET']
  #:region => ENV["S3_REGION"]
  }
  config.fog_directory  = 'autorickshaw'
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  # To let CarrierWave work on heroku
end   			