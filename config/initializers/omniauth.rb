Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['KEY'], ENV['SECRET']
  end