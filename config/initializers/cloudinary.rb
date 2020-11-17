Cloudinary.config do |config|
  config.cloud_name = ENV["cloud_name"]
  config.api_key = ENV["api_key"]
  config.api_secret = ENV["api_secret"]
  config.enhance_image_tag = ENV["enhance_image_tag"]
  config.static_file_support = ENV["static_file_support"]
end