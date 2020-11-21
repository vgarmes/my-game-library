Cloudinary.config do |config|
  config.cloud_name = ENV["CLOUD_NAME"]
  config.api_key = ENV["API_KEY"]
  config.api_secret = ENV["API_SECRET"]
  config.enhance_image_tag = ENV["ENHANCE_IMAGE_TAG"]
  config.static_file_support = ENV["STATIC_FILE_SUPPORT"]
end