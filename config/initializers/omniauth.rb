OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '484639464936447', '7c70a0a6b6521f980b4ab369d708a81a', :client_options => {:ssl => {:verify => false}}
end
